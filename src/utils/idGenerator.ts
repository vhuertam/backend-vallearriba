import { Estates } from "src/entities";
import { InputProcessBatch, InputSaveBatch, InputTransportBatch } from "src/graphql.schema";




export const generateIdProcessBatch = async (processBatchData: InputProcessBatch, estate: Estates): Promise<string> => {
    try {

        const { condition, date } = processBatchData;

        const org = 'Orgánica';
        const conv = 'Convencional';
        const buff = 'Buffer';

        const lirios = 'Los Lirios'
        const tabali = 'Tabali'

        if(estate.name === lirios) {
            if(condition === org) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /BUFF`
            }
        }

        if(estate.name === tabali) {
            if(condition === org) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                processBatchData.idProcessBatch = `P${estate.idEstate}${date} /BUFF`
            }
        }

        return processBatchData.idProcessBatch;
        
    } catch (error) {
        throw error;
    }
  };

export const generateIdSaveBatch = async (saveBatchData: InputSaveBatch, estate: Estates): Promise<string> => {
    try {

        const { idStoragePond, date, condition } = saveBatchData;

        const org = 'Orgánica';
        const conv = 'Convencional';
        const buff = 'Buffer';

        const lirios = 'Los Lirios'
        const tabali = 'Tabali'

        if(estate.name === lirios) {
            if(condition === org) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /BUFF`
            }
        }

        if(estate.name === tabali) {
            if(condition === org) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                saveBatchData.idSaveBatch = `G${idStoragePond}${estate.idEstate}${date} /BUFF`
            }
        }

        return saveBatchData.idSaveBatch;

    } catch (error) {
        throw error;
    }
  };

export const generateIdTransportBatch = async (transportBatchData: InputTransportBatch, estate: Estates): Promise<string> => {
    try {

        const { condition, date } = transportBatchData;

        const org = 'Orgánica';
        const conv = 'Convencional';
        const buff = 'Buffer';

        const lirios = 'Los Lirios'
        const tabali = 'Tabali'

        if(estate.name === lirios) {
            if(condition === org) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /BUFF`
            }
        }

        if(estate.name === tabali) {
            if(condition === org) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /ORG`
            }else if(condition === conv) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /CONV`
            }else if(condition === buff) {
                transportBatchData.idTransportBatch = `T${estate.idEstate}${date} /BUFF`
            }
        }

        return transportBatchData.idTransportBatch;

    } catch (error) {
        throw error;
    }
  };
  