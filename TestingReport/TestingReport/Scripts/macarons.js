var e_macarons = {
    // Ĭ��ɫ��
    color: [
        '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
        '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
        '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
        '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
    ],
    // ͼ�����
    title: {
        itemGap: 8,
        textStyle: {
            fontWeight: 'normal',
            color: '#008acd'          // ������������ɫ
        }
    },
     
    // ͼ��
    legend: {
        itemGap: 8
    },
     
    // ֵ��
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
    // ��ʾ��
    tooltip: {
        backgroundColor: 'rgba(50,50,50,0.5)',     // ��ʾ������ɫ��Ĭ��Ϊ͸����Ϊ0.7�ĺ�ɫ
        axisPointer : {            // ������ָʾ���������ᴥ����Ч
            type : 'line',         // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
            lineStyle : {          // ֱ��ָʾ����ʽ����
                color: '#008acd'
            },
            crossStyle: {
                color: '#008acd'
            },
            shadowStyle : {                     // ��Ӱָʾ����ʽ����
                color: 'rgba(200,200,200,0.2)'
            }
        }
    },
    // �������ſ�����
    dataZoom: {
        dataBackgroundColor: '#efefff',            // ���ݱ�����ɫ
        fillerColor: 'rgba(182,162,222,0.2)',   // �����ɫ
        handleColor: '#008acd'    // �ֱ���ɫ
    },
    // ����
    grid: {
        borderColor: '#eee'
    },
   
    
  
    // ����ͼĬ�ϲ���
    line: {
        smooth : true,
        symbol: 'emptyCircle',  // �յ�ͼ������
        symbolSize: 15,           // �յ�ͼ�δ�С
		size: 10
    },

     
    textStyle: {
        fontFamily: '΢���ź�, Arial, Verdana, sans-serif'
    }
}