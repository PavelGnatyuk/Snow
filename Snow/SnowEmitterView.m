#import "SnowEmitterView.h"
#import <QuartzCore/QuartzCore.h>

@interface SnowEmitterView()

@property (retain) CAEmitterLayer *snowLayer;

@end

@implementation SnowEmitterView

-(id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		self.backgroundColor = [UIColor clearColor];
        [self prepare];
	}
	
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		self.backgroundColor = [UIColor clearColor];
        [self prepare];
	}
	
	return self;
}

- (void)dealloc
{
    [_snowLayer release];
    [super dealloc];
}

+ (Class) layerClass {
    return [CAEmitterLayer class];
}

- (void)prepare
{
    CAEmitterLayer *snowLayer = [self makeEmitterAtPoint:CGPointMake(20, 20)];
    CAEmitterCell *snowCell1 = [self makeEmitterCellWithParticle:@"snow"];
    [snowLayer setEmitterCells:@[snowCell1]];
    [self setSnowLayer:snowLayer];
}

- (CAEmitterLayer *)makeEmitterAtPoint:(CGPoint)point {
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
	emitterLayer.name = @"snowLayer";
	emitterLayer.emitterPosition = CGPointMake(CGRectGetMidX([self bounds]), 10);
	emitterLayer.emitterZPosition = -43;
	emitterLayer.emitterSize = CGSizeMake([self bounds].size.width, 10.00);
	emitterLayer.emitterDepth = 0.00;
	emitterLayer.emitterShape = kCAEmitterLayerCircle;
	emitterLayer.emitterMode = kCAEmitterLayerSurface;
	emitterLayer.renderMode = kCAEmitterLayerBackToFront;
	emitterLayer.seed = 721963909;
    return emitterLayer;
}

- (CAEmitterCell *)makeEmitterCellWithParticle:(NSString *)name
{
	CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
	
	emitterCell.name = @"snow";
	emitterCell.enabled = YES;
    
	emitterCell.contents = (id)[[UIImage imageNamed:name] CGImage];
	emitterCell.contentsRect = CGRectMake(0.00, 0.00, 1.00, 1.00);
    
	emitterCell.magnificationFilter = kCAFilterTrilinear;
	emitterCell.minificationFilter = kCAFilterLinear;
	emitterCell.minificationFilterBias = 0.00;
    
	emitterCell.scale = 0.72;
	emitterCell.scaleRange = 0.14;
	emitterCell.scaleSpeed = -0.25;
    
	emitterCell.color = [[UIColor colorWithRed:0.77 green:0.55 blue:0.60 alpha:0.55] CGColor];
	emitterCell.redRange = 0.9;
	emitterCell.greenRange = 0.8;
	emitterCell.blueRange = 0.7;
	emitterCell.alphaRange = 0.8;
    
	emitterCell.redSpeed = 0.92;
	emitterCell.greenSpeed = 0.84;
	emitterCell.blueSpeed = 0.74;
	emitterCell.alphaSpeed = 0.55;
    
	emitterCell.lifetime = 9.0;
	emitterCell.lifetimeRange = 2.37;
	emitterCell.birthRate = 0;
	emitterCell.velocity = -20.00;
	emitterCell.velocityRange = 2.00;
	emitterCell.xAcceleration = 1.00;
	emitterCell.yAcceleration = 10.00;
	emitterCell.zAcceleration = 12.00;
    
	// these values are in radians, in the UI they are in degrees
	emitterCell.spin = 0.384;
	emitterCell.spinRange = 0.925;
	emitterCell.emissionLatitude = 1.745;
	emitterCell.emissionLongitude = 1.745;
	emitterCell.emissionRange = 3.491;
    
    return emitterCell;
}

- (void)start
{
    [[self snowLayer] setValue:@5 forKeyPath:@"emitterCells.snow.birthRate"];
    [[self layer] addSublayer:[self snowLayer]];
}

- (void)stop
{
    [[self snowLayer] setValue:@0 forKeyPath:@"emitterCells.snow.birthRate"];
    [[self snowLayer] removeFromSuperlayer];
}

@end
