# encoding: utf-8
require 'json'
require 'rest-client'

class VinClient
  attr_accessor :data
  def initialize
    @root_folder = File.join(File.dirname(__FILE__), "..")
    read_sub
    @url = URI::encode("http://localhost:3000/vin/")
    @manual_override = false
  end


  ############################
  # Data readers and helpers
  ############################
  def read_data example
    file = File.read(File.join(@root_folder, "lib","data", example))
    @data = JSON.parse(file)
  end

  def read_sub example="sub.json"
    read_data example
  end

  def read_note example="note.json"
    read_data example
  end

  def read_rating example="rating.json"
    read_data example
  end

  def read_admin example="admin.json"
    read_data example
  end
  
  def print_json
    @data.to_json
  end


  ##################
  # HTTP operations
  ##################
  def get_request url
    response = RestClient.get url.to_s
    JSON.parse(response)
  end

  def post_request url
    response = RestClient.post(url.to_s, @data)
    JSON.parse(response)
  end

  def put_request url
    response = RestClient.put(url.to_s, @data)
    JSON.parse(response)
  end

  def delete_request url
    response = RestClient.delete url.to_s
    JSON.parse(response)
  end

  
  ################
  # Use cases API
  ################  
  def post_sub options = {}
    url = URI::join(@url, "subs")
    read = options[:read]
    if read.nil?
      read_sub
    else
      read_sub read
    end
    post_request url
  end

  def put_sub id, options = {}
    url = URI::join(@url, "subs/", "#{id}")
    read = options[:read]
    if read.nil?
      read_sub
    else
      read_sub read
    end
    put_request url
  end

  def get_sub id
    url = URI::join(@url, "subs/", "#{id}")
    get_request url
  end

  def get_wines id
    url = URI::join(@url,"subs/#{id}/search?q=red")
    get_request url
  end

  def get_shipments uid
    url = URI::join(@url,"subs/#{uid}/shipments")
    get_request url
  end

  def get_shipment uid, sid
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}")
    get_request url
  end

  # REQUIREMENT REMOVED?!?!?!
  # def put_shipment uid, sid
  #   url = URI::join(@url,"subs/#{uid}/shipments/#{sid}")
  #   put_request url
  # end

  def get_shipment_notes uid, sid
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}/notes")
    get_request url
  end

  def post_shipment_notes uid, sid, options = {}
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}/notes")
    read = options[:read]
    if read.nil?
      read_note
    else
      read_note read
    end
    post_request url
  end

  def get_shipment_note uid, sid, nid
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}/notes/#{nid}")
    get_request url
  end

  def put_shipment_note uid, sid, nid, options = {}
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}/notes/#{nid}")
    read = options[:read]
    if read.nil?
      read_note
    else
      read_note read
    end
    put_request url
  end

  def delete_shipment_note uid, sid, nid
    url = URI::join(@url,"subs/#{uid}/shipments/#{sid}/notes/#{nid}")
    delete_request url
  end

  def get_wines uid
    url = URI::join(@url,"subs/#{uid}/wines")
    get_request url
  end

  def get_wine uid, wid
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}")
    get_request url
  end

  def get_wine_notes uid, wid
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/notes")
    get_request url
  end

  def post_wine_notes uid, wid, options = {}
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/notes")
    read = options[:read]
    if read.nil?
      read_note
    else
      read_note read
    end
    post_request url
  end

  def get_wine_note uid, wid, nid
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/notes/#{nid}")
    get_request url
  end

  def put_wine_note uid, wid, nid, options = {}
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/notes/#{nid}")
    read = options[:read]
    if read.nil?
      read_note
    else
      read_note read
    end
    put_request url
  end

  def delete_wine_note uid, wid, nid
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/notes/#{nid}")
    delete_request url
  end

  def get_wine_rating uid, wid
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/rating")
    get_request url
  end

  def post_wine_rating uid, wid, options = {}
    url = URI::join(@url,"subs/#{uid}/wines/#{wid}/rating")
    read = options[:read]
    if read.nil?
      read_rating
    else
      read_rating read
    end
    post_request url
  end

  def get_user_delivery uid
    url = URI::join(@url,"subs/#{uid}/delivery")
    get_request url
  end

  def put_user_delivery uid, options = {}
    url = URI::join(@url,"subs/#{uid}/delivery")
    read = options[:read]
    if read.nil?
      # read some delivery example
    else
      # read some delivery example read
    end
    put_request url
  end

  def post_admin options = {}
    url = URI::join(@url,"admins")
    read = options[:read]
    if read.nil?
      read_admin
    else
      read_admin read
    end
    post_request url
  end

  def get_admins
    url = URI::join(@url,"admins")
    get_request url
  end

  def get_admin aid
    url = URI::join(@url,"admins/#{aid}")
    get_request url
  end

  def put_admin aid, options = {}
    url = URI::join(@url,"admins/#{aid}")
    read = options[:read]
    if read.nil?
      read_admin
    else
      read_admin read
    end
    put_request url
  end

end