class Content < ActiveRecord::Base
	extend FriendlyId
	friendly_id :titolo, use: :slugged

		has_many :sales
	 belongs_to :user
	 has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
 	 validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
 	 message: "Sole le immagini sono supportate"
 	 
 	 has_attached_file :allegato
 	 #validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/mspowerpoint', 'application/vnd.ms-powerpoint', 'application/vdn.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel', 'application/vdn.ms-excel', 'application/vnd.openxmlformat-officedocument.spreadsheetml.sheet', 'audio/mpeg', 'audio/mp3' ],
 	 validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/mspowerpoint', 'application/vnd.ms-powerpoint', 'application/vdn.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel', 'application/vdn.ms-excel', 'application/x-msexcel', 'application/x-ms-excel', 'application/x-excel', 'application/x-dos_ms_excel', 'application/xls', 'application/x-xls', 'application/xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet (xlsx)', 'application/vnd.openxmlformat-officedocument.spreadsheetml.sheet', 'audio/mpeg', 'audio/mp3', 'video/mp4' ],
 	 message: "Formato non supportato"

 	 validates :titolo, :descrizione, :price, presence: true
 	 validates :price, numericality:{greater_than: 0.49}
 	 validates :cover, :allegato, attachment_presence: true
end
