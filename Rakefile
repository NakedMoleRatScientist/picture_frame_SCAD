require "tempfile"
require "zip"
manifest =
{
    :version => "R1",
    :project_name => "PictureFrameSCAD"
}
directory_name = manifest[:project_name] + "-" + manifest[:version]

task :create do
     project_dir = Dir.getwd()
     zip = (directory_name + ".zip")
     list = ["picture_frame.scad","customizer.scad","nail_box.scad","acrylic_pane.scad"]
     Zip::File.open(zip, create: true) do |zipfile|
        list.each do |filename|
        zipfile.add(filename, File.join(project_dir, filename))
     end
  end
end

task :remove do
    FileUtils.rm_r(directory_name + ".zip")
end
