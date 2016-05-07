class WikiscraperController < ApplicationController
  def index
    iso_3166_1_a2_urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2'
    iso_3166_1_a3_urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3'
    iso_3166_1_n_urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_numeric'
    iso_3166_2_urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-2'
    iso_3166_3_urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-3'
  end
  def iso_3166_1_a2
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2'
    url = URI.parse(urlstr)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    #@table = @doc.css('.wikitable.sortable.jquery-tablesorter')
    @table = @doc.css('.wikitable.sortable')[0]
    #@tablebody = @doc.css('tbody')
    @rows = @table.css('tr')[2..-1]
    @rows.each do |row|
      cells = row.css('td')
      dat = []
      i = 0
      while i < 4
        if not cells[i].nil?
          dat[i] = cells[i].content
        end
        i = i + 1
      end
      cnt = Wiki::Country.where iso_name: dat[1]
      if cnt.first.nil?
        Wiki::Country.create alpha_2: dat[0], iso_name: dat[1], year_added: dat[2], domain: dat[3]
      elsif cnt.first.alpha_2.nil?
        cnt.first.alpha_2 = dat[0]
        cnt.first.save
      elsif not cnt.first.alpha_2 == dat[0]
        Wiki::Country.create alpha_2: dat[0], iso_name: dat[1], year_added: dat[2], domain: dat[3]
      end
    end
  end
  def iso_3166_1_a3
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3'
    url = URI.parse(urlstr)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('table')[0]
    subtables = @table.css('table')
    @rows = @table.css('table tr')[2..-1]
    @rows.each do |row|
      cells = row.css('td')
      dat = []
      i = 0
      while i < 2
        if not cells[i].nil?
          dat[i] = cells[i].content
        end
        i = i + 1
      end
      cnt = Wiki::Country.where iso_name: dat[1]
      if cnt.first.nil?
        Wiki::Country.create alpha_3: dat[0], iso_name: dat[1]
      elsif cnt.first.alpha_3.nil?
        cnt.first.alpha_3 = dat[0]
        cnt.first.save
      elsif not cnt.first.alpha_3 == dat[0]
        Wiki::Country.create alpha_3: dat[0], iso_name: dat[1]
      end
    end
  end
  def iso_3166_1_n
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-1_numeric'
    url = URI.parse(urlstr)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('.wikitable.sortable')[0]
    @rows = @table.css('tr')[2..-1]
    @rows.each do |row|
      cells = row.css('td')
      dat = []
      i = 0
      while i < 2
        if not cells[i].nil?
          dat[i] = cells[i].content
        end
        i = i + 1
      end
      cnt = Wiki::Country.where iso_name: dat[1]
      if cnt.first.nil?
        Wiki::Country.create numeric: dat[0], iso_name: dat[1]
      elsif cnt.first.numeric.nil?
        cnt.first.numeric = dat[0]
        cnt.first.save
      elsif not cnt.first.numeric == dat[0]
        Wiki::Country.create numeric: dat[0], iso_name: dat[1]
      end
    end
  end
  def iso_3166_2
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-2'
    url = URI.parse(urlstr)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('.wikitable.sortable')[0]
    @rows = @table.css('tr')[1..-1]
    @subds = []
    @error = []
    i = 0
    j = 0
    @rows.each do |row|
      ca2 = row.css('td')[0].content
      rrows = iso_3166_2_cf(ca2)
      if not rrows.nil?
        rrows.each do |rrow|
          cells = rrow.css('td')
          subd = [ca2,cont(cells,0),cont(cells,1),cont(cells,2),cont(cells,3)]
          @subds[i] = subd
      cnt = Wiki::Country.where alpha_2: subd[0]
      sub = Wiki::CountrySubdivision.where country: cnt.first, alpha: subd[1]
      if sub.first.nil?
        if subd[3].nil?
          Wiki::CountrySubdivision.create country: cnt.first, alpha: subd[1], iso_name: subd[2]
        else
          Wiki::CountrySubdivision.create country: cnt.first, alpha: subd[1], native_name: subd[2], iso_name: subd[3], native_transcription: subd[4]
        end
      end
          i = i + 1
        end
      else
        @error[j] = ca2
        j = j + 1
      end
    end
  end
  def iso_3166_2_h
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-2'
    url = URI.parse(urlstr)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('.wikitable.sortable')[0]
    @rows = @table.css('tr')[1..-1]
    @cols = []
    i = 0
    j = 0
    @rows.each do |row|
      ca2 = row.css('td')[0].content
      head = iso_3166_2_cf(ca2)
      if not head.nil?
        hs = head.css('th')
        hs.each do |h|
          contains = false
          @cols.each do |col|
            if col.eql? h.content
              contains = true
            end
          end
          if contains == false
            @cols.append h
          end
        end
      end
    end
  end
  def iso_3166_2_c
    @c = params[:ca2]
    @rows = iso_3166_2_cf(@c)
  end
  def cont(cell,i)
    if not cell[i].nil?
      return cell[i].content
    else
      return ''
    end
  end
  def iso_3166_2_cf(c)
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-2'
    url = URI.parse(urlstr+':'+c)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('.wikitable.sortable')[0]
    if @table.nil?
      return nil
    end
    rows = @table.css('tr')[1..-1]
    return rows
  end
  def iso_3166_2_cfh(c)
    urlstr = 'https://en.wikipedia.org/wiki/ISO_3166-2'
    url = URI.parse(urlstr+':'+c)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(req)
    @doc = Nokogiri::HTML(res.body)
    @table = @doc.css('.wikitable.sortable')[0]
    if @table.nil?
      return nil
    end
    head = @table.css('tr')[0]
    return head
  end
end
