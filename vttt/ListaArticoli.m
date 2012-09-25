//
//  ListaArticoli.m
//  vttt
//
//  Created by Marco Velluto on 30/08/12.
//  Copyright (c) 2012 Marco Velluto. All rights reserved.
//

#import "ListaArticoli.h"

@interface ListaArticoli()

@property (nonatomic, strong) NSMutableArray* listaArticoli;

@end

@implementation ListaArticoli

@synthesize listaArticoli = _listaArticoli;
@synthesize lista = _lista;
@synthesize defaultValuta = _defaultValuta;


#pragma mark - Inizializzazione

- (id)init {
    
    self = [super init];
    if (self) {
        
        _listaArticoli = [[NSMutableArray alloc] init];
        _defaultValuta = EURO;
    }
    return self;
}

#pragma mark - Metodi di Comodo

- (void)setDefaultValuta:(TipoValuta)defaultValuta {
    
    if (_defaultValuta == EURO) return;
    _defaultValuta = defaultValuta;
    
    //Invio notifica
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangedCurrencyNotification object:self];
}

- (void)addArticle:(Articolo *)articolo {
    
    //Invio messaggi KVO
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:[NSIndexSet indexSetWithIndex:0] forKey:KVOListChangedkey];
    
    //Inserisco all'inizio dell'elenco
    [self.listaArticoli insertObject:articolo atIndex:0];
    
    //Invio KVO
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:[NSIndexSet indexSetWithIndex:0] forKey:KVOListChangedkey];
    
}

- (void)removeArticle:(NSUInteger)index {
    
    //Invio messaggi KVO
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:KVOListChangedkey];
    
    //Rimuovo l'articolo
    [self.listaArticoli removeObjectAtIndex:index];
    
    //Invio messaggi KVO
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:index] forKey:KVOListChangedkey];
}

+ (NSArray *)articoliToDictionry:(NSDictionary *)dictionary {
    
    NSMutableArray *listaTemp;
    for (id key in dictionary) {
        
        id value = [dictionary objectForKey:key];
        
        for (id riga in value) {
            
            id stringa = (NSString *)riga;
            NSLog(@"Stringa = '%@'", stringa);
            [listaTemp addObject:stringa];
        }
    }
    return [[NSArray alloc] initWithArray:listaTemp];
}

#pragma mark - virtual property

+ (NSSet *)keyPathsForValuesAffectingLista {
    
    return [NSSet setWithObjects:@"listaArticoli", nil];
}

- (NSArray *)lista {
    
    return self.listaArticoli;
}

@end
