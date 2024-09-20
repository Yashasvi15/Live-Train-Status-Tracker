public class TrainDetails {
       
        @AuraEnabled
        public static TrainDetailsWrapper getTrainDetails(String trainNo){
    
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndPoint('callout:Train_Info/apis/train.php?train_no='+ trainNo);
            req.setMethod('GET');
            HttpResponse res = http.send(req);
            System.debug('response ->'+res.getBody());
    
            TrainDetailsWrapper twrap = new TrainDetailsWrapper();
            if(res.getStatusCode()==200)
            {
                twrap = (TrainDetailsWrapper) JSON.deserialize(res.getBody(),TrainDetailsWrapper.class);
            }
            return twrap;
    
    }
    
    public class TrainDetailsWrapper {
        @AuraEnabled public boolean success{get;set;}
        @AuraEnabled public String train_name{get;set;}
        @AuraEnabled public String message{get;set;}
        @AuraEnabled public String updated_time{get;set;}
        @AuraEnabled public List<Data> data {get;set;}
    }
    public class Data{
        @AuraEnabled public boolean is_current_station{get;set;}
        @AuraEnabled public String station_name{get;set;}
        @AuraEnabled public String distance{get;set;}
        @AuraEnabled public String timing{get;set;}
        @AuraEnabled public String delay{get;set;}
        @AuraEnabled public String platform{get;set;}
        @AuraEnabled public String halt{get;set;}
    }
    }