Pod::Spec.new do |s|
# ------------------ 组件基本信息段---------------------
# 该部分组件描述主要描述组件的基本信息

# [必填]组件名称，组件名称用于标识组件,不可重复
s.name             = '${POD_NAME}'

# [必填]组件版本，组件版本通过Jenkins打包组件可以进行修改
s.version          = '0.1.0'#不需要修改

# [必填]组件简介，简单描述组件的作用
s.summary          = 'A short description of ${POD_NAME}.'

# [必填]组件详细描述，描述组件拥有的功能
s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC

s.homepage         = 'https://github.com/${USER_NAME}/${POD_NAME}'

# [必填]组件作者信息，描述组件的负责人和内网邮箱
s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }

# [必填]组件的法务信息，此部分描述组件的license信息，将license信息根据组件开发规范放置即可
# 一般不需要修改次部分路径配置，可以根据组件实际情况修改type字段，使用组件生成工具生成组件podspec
# 默认组件licese的type为hikvision
s.license          = { :type => 'MIT', :file => 'LICENSE' }

# ------------------ 组件所需环境信息段 ---------------------
# 该部分组件描述主要描述组件的必须需要的环境条件

# [必填]填写组件需要的最低系统环境
s.ios.deployment_target = '8.0'

# 如果有新增，则补充在frameworks后边。不能单独起一行farmeworks。否会会有问题
s.ios.frameworks  = 'UIKit','Foundation'
# -------------------------------------------------------
# ------------------ 组件依赖信息段 ------------------------
# 该部分组件描述主要描述组件依赖公司产品库中的组件信息

#s.ios.dependency 'C_YM_Router'
#s.ios.dependency 'C_YM_Network'
#s.ios.dependency 'C_YM_BaseModule'
#s.ios.dependency 'C_YM_Utils'
#s.ios.dependency 'B_YM_IGListTemplate'

# -------------------------------------------------------
# ------------------ 组件根路径信息段 ----------------------
s.source           = { :git => 'https://github.com/${USER_NAME}/${POD_NAME}.git', :tag => s.version.to_s }
# --------------------------------------------------------

# ------------------ 组件打包编译信息段 ----------------------
s.source_files          = 'source/${POD_NAME}/code/*.{h,m}','source/${POD_NAME}/code/**/*.{h,m}'
s.prefix_header_file = 'source/${POD_NAME}/${POD_NAME}-Prefix.pch'
# 组件资源文件打包方式，根据组件实际情况进行填写
# s.resources = ['code/res/Images.xcassets']

# 组件依赖情况，这里需要依赖不在公司仓库的静态通用组件或三方开源组件
# 如果依赖组件为动态库，则必须把这个动态库发布到公司仓库
# 否则其他组件在使用本组件时，无法下载依赖组件
# s.dependency 'AFNetworking', '~> 3.0'
# s.libraries      =  "iconv"

# 根据实际需要进行补充

s.ios.resources = [
'ModuleInfo.plist', #组件描述文件
'source/${POD_NAME}/Images.xcassets'     #多语言资源
]


# -------------------------------------------------------


#------------------ 不需要修改字段 --------------------------
s.pod_target_xcconfig  = {
'FRAMEWORK_SEARCH_PATHS'        => '$(inherited) ${PODS_ROOT}/**',
'LIBRARY_SEARCH_PATHS'          => '$(inherited) ${PODS_ROOT}/**',
'ENABLE_BITCODE'                => 'NO',
'OTHER_LDFLAGS'                 => '$(inherited) -ObjC',
'STRINGS_FILE_OUTPUT_ENCODING'  => 'UTF-8'
}

end


