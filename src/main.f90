program main
  use global_var, only: wp, stdout
  use fileIO, only:  Atom, ReadData, region, eamAlloyFile, &
      ReadEamAlloyFile
  use computeUE, only: Energy
  implicit none
  type(eamAlloyFile) :: CuTa             !< 含有CuTa.eam.alloy势函数信息和预处理之后的数据的派生变量
  type(Atom), allocatable :: Model(:)    !< 模型文件
  type(region) :: box                    !< 模型文件中的盒子大小
  REAL(WP) :: power

  call ReadEamAlloyFile('../potential/CoCuFeNiPd.set', CuTa)    !! 读取势函数文件
  call ReadData('../model/200w.lmp', box, Model)                !! 读取模型文件
  call Energy(CuTa, Model, power, box)                          !! 计算模型势能
  write(stdout, *) power, ' ev'                                 !! 将模型势能输出到屏幕上面

end program main