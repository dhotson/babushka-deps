dep 'codemod' do
  path = '/usr/local/bin/codemod'.p
  url = 'https://github.com/facebook/codemod/raw/master/src/codemod.py'
  met? { path.executable? }
  meet {
    in_download_dir do
      log_shell "Downloading codemod from #{url}", "wget --no-check-certificate #{url}"
      sudo "mkdir -p `dirname #{path}`"
      sudo "mv codemod.py #{path}; chmod 755 #{path}"
    end
  }
end
