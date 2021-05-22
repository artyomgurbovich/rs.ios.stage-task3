#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray *months = @[@"January",
                    @"February",
                    @"March",
                    @"April",
                    @"May",
                    @"June",
                    @"July",
                    @"August",
                    @"September",
                    @"October",
                    @"November",
                    @"December"];
    if (monthNumber < 1 || monthNumber > 12) return nil;
    return [months objectAtIndex:monthNumber-1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    NSDateComponents *dateComponents = [calendar components: NSCalendarUnitDay fromDate: dateFromString];
    return dateComponents.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setLocale:[NSLocale localeWithLocaleIdentifier: @"ru_RU"]];
    NSDateComponents *dateComponents = [calendar components: NSCalendarUnitWeekday fromDate: date];
    if (dateComponents == nil) return nil;
    
    return calendar.shortWeekdaySymbols[(dateComponents.weekday - 1) % 7];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *todaysComponents = [calendar components:NSCalendarUnitWeekOfYear fromDate:[NSDate date]];
    NSUInteger todaysWeek = [todaysComponents weekOfYear];
    NSDateComponents *otherComponents = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    NSUInteger datesWeek = [otherComponents weekOfYear];
    return todaysWeek == datesWeek;
}

@end
