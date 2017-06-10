var e_macarons = {
    // 默认色板
    color: [
        '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
        '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
        '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
        '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
    ],
    // 图表标题
    title: {
        itemGap: 8,
        textStyle: {
            fontWeight: 'normal',
            color: '#008acd'          // 主标题文字颜色
        }
    },
     
    // 图例
    legend: {
        itemGap: 8
    },
     
    // 值域
    dataRange: {
        itemWidth: 15,
        //color:['#1e90ff','#afeeee']
        color: ['#2ec7c9','#b6a2de']
    },
    toolbox: {
        color : ['#1e90ff', '#1e90ff', '#1e90ff', '#1e90ff'],
        effectiveColor : '#ff4500',
        itemGap: 8
    },
    // 提示框
    tooltip: {
        backgroundColor: 'rgba(50,50,50,0.5)',     // 提示背景颜色，默认为透明度为0.7的黑色
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#008acd'
            },
            crossStyle: {
                color: '#008acd'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.2)'
            }
        }
    },
    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#efefff',            // 数据背景颜色
        fillerColor: 'rgba(182,162,222,0.2)',   // 填充颜色
        handleColor: '#008acd'    // 手柄颜色
    },
    // 网格
    grid: {
        borderColor: '#eee'
    },
   
    
  
    // 折线图默认参数
    line: {
        smooth : true,
        symbol: 'emptyCircle',  // 拐点图形类型
        symbolSize: 15,           // 拐点图形大小
		size: 10
    },

     
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
}