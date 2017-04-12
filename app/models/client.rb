class Client < ApplicationRecord
  geocoded_by :city   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def infos
    return payload
  end

  def payload
    "<div class='well list-group'>
      <a href='https://client-prospector.herokuapp.com/backend/clients/#{self.id}'>
      <h2 class='text-center'>#{self.company_name}</h2>
      <ul>
        <li class='list-group-item'>Gender : #{self.gender}</li>
        <li class='list-group-item'>Name : #{self.name}</li>
        <li class='list-group-item'>Company name : #{self.company_name}</li>
        <li class='list-group-item'>City : #{self.city}</li>
        <li class='list-group-item'>Country : #{self.country}</li>
        <li class='list-group-item'>Adr1 : #{self.adr1}</li>
        <li class='list-group-item'>Adr2 : #{self.adr2}</li>
        <li class='list-group-item'>Phone1 : #{self.phone1}</li>
        <li class='list-group-item'>Phone2 : #{self.phone2}</li>
      </ul>
      </a>
    </div>"
    #self.inspect
  end
end
