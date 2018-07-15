print('In my module')

def find_index(list_to_search,target):
        ''' Find index of a list from input list
        parameters
        ----------
            list_to_search: list
            target: string
        Returns
        -------
            index of target
        '''
        print('type of target {}'.format(type(target)))
        for idx,value in enumerate(list_to_search):
            print('type of element {}'.format(type(value)))
            if(value==target):
                return idx
        return -1
        