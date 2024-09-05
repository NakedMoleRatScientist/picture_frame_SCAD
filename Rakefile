require "tempfile"
require "zip"
manifest =
{
    :version => "R1",
    :project_name => "UtilitySCAD"
}
directory_name = manifest[:project_name] + "-" + manifest[:version]

task :create do
     project_dir = Dir.getwd()
     zip = (directory_name + ".zip")
     list = ["utility.scad","examples.scad","hooks.scad"]
     Zip::File.open(zip, create: true) do |zipfile|
        list.each do |filename|
        zipfile.add(filename, File.join(project_dir, filename))
     end
  end
end

task :remove do
    FileUtils.rm_r(directory_name + ".zip")
end
