<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/common/HeadTag.jsp" />
<title>Team2</title>
<style type="text/css">

</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<!-- Top -->
	<c:import url="/common/Top.jsp" />

	<section id="home-section" class="hero">
		<img src="images/blob-shape-3.svg" class="svg-blob"
			alt="Colorlib Free Template">
		<div class="home-slider owl-carousel">
			<div class="slider-item">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-md-flex no-gutters slider-text align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last">
							<div class="img" style="background-image: url(images/bg_1.jpg);">
								<div class="overlay"></div>
							</div>
							<div class="bg-primary">
								<div class="vr">
									<span class="pl-3 py-4"
										style="background-image: url(images/bg_1-1.jpg);">Greece</span>
								</div>
							</div>
						</div>
						<div class="one-forth d-flex align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading pl-5">Discover Greece</span>
								<h1 class="mb-4 mt-3">Explore Your Travel Destinations like
									never before</h1>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country.</p>

								<p>
									<a href="#" class="btn btn-primary px-5 py-3 mt-3">Discover
										<span class="ion-ios-arrow-forward"></span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="slider-item">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-flex no-gutters slider-text align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last">
							<div class="img" style="background-image: url(images/bg_2.jpg);">
								<div class="overlay"></div>
							</div>
							<div class="vr">
								<span class="pl-3 py-4"
									style="background-image: url(images/bg_2-2.jpg);">Africa</span>
							</div>
						</div>
						<div class="one-forth d-flex align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading pl-5">Discover Africa</span>
								<h1 class="mb-4 mt-3">
									Never Stop Exploring</span>
								</h1>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country.</p>

								<p>
									<a href="#" class="btn btn-primary px-5 py-3 mt-3">Discover
										<span class="ion-ios-arrow-forward"></span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container">
			<div class="row justify-content-center pb-0 pb-mb-5 pt-5 pt-md-0">
				<div class="col-md-12 heading-section ftco-animate">
					<span class="subheading">Sexy &amp; Healthy</span>
					<h2 class="mb-4">Where do you want to go?</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="search-wrap-1 ftco-animate p-4">
						<form action="#" class="search-property-1">
							<div class="row">
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">Destination</label>
										<div class="form-field">
											<div class="icon">
												<span class="ion-ios-search"></span>
											</div>
											<input type="text" class="form-control"
												placeholder="Search place">
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">Check-in date</label>
										<div class="form-field">
											<div class="icon">
												<span class="ion-ios-calendar"></span>
											</div>
											<input type="text" class="form-control checkin_date"
												placeholder="Check In Date">
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">Check-out date</label>
										<div class="form-field">
											<div class="icon">
												<span class="ion-ios-calendar"></span>
											</div>
											<input type="text" class="form-control checkout_date"
												placeholder="Check Out Date">
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">Price Limit</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon">
													<span class="ion-ios-arrow-down"></span>
												</div>
												<select name="" id="" class="form-control">
													<option value="">$5,000</option>
													<option value="">$10,000</option>
													<option value="">$50,000</option>
													<option value="">$100,000</option>
													<option value="">$200,000</option>
													<option value="">$300,000</option>
													<option value="">$400,000</option>
													<option value="">$500,000</option>
													<option value="">$600,000</option>
													<option value="">$700,000</option>
													<option value="">$800,000</option>
													<option value="">$900,000</option>
													<option value="">$1,000,000</option>
													<option value="">$2,000,000</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-self-end">
									<div class="form-group">
										<div class="form-field">
											<input type="submit" value="Search"
												class="form-control btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-services-2" id="services-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Sexy &amp; Healthy</span>
					<h2 class="mb-4">Our Services</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-gliding"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Activities</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-world"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Travel Arrangement</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-tour-guide"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Private Guide</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-map-of-roads"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Location Manager</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row no-gutters d-flex">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img d-flex align-self-stretch align-items-center"
						style="background-image: url(images/about.jpg);"></div>
				</div>
				<div class="col-md-6 col-lg-7 px-lg-5 py-md-5 bg-darken">
					<div class="py-md-5">
						<div class="row justify-content-start pb-3">
							<div class="col-md-12 heading-section ftco-animate p-5 p-lg-0">
								<span class="subheading">Get in touch with us</span>
								<h2 class="mb-4">Get Best Travel Deals</h2>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country, in which roasted parts of sentences fly
									into your mouth.</p>
								<p>Even the all-powerful Pointing has no control about the
									blind texts it is an almost unorthographic life One day however
									a small line of blind text by the name of Lorem Ipsum decided
									to leave for the far World of Grammar.</p>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country, in which roasted parts of sentences fly
									into your mouth.</p>
								<p>
									<a href="#" class="btn btn-primary py-3 px-4">Book now</a> <a
										href="#" class="btn btn-white py-3 px-4">Contact us</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-intro img" id="destination-section"
		style="background-image: url(images/bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-9 text-center">
					<h2>Choose the Perfect Destination</h2>
					<p>We can manage your dream building A small river named Duden
						flows by their place</p>
					<p class="mb-0">
						<a href="#" class="btn btn-white px-4 py-3">Search Places</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Best Destination</span>
					<h2 class="mb-4">Best Place to Travel</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<div class="vr">
								<span>Sale</span>
							</div>
							<a href="destination.html"><img
								src="images/destination-1.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">
								<span class="old-price mr-2">$500</span>$400
							</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-1.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="destination.html"><img
								src="images/destination-2.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-2.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="destination.html"><img
								src="images/destination-3.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-3.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="destination.html"><img
								src="images/destination-4.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-4.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="destination.html"><img
								src="images/destination-5.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-5.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="destination.html"><img
								src="images/destination-6.jpg" class="img-fluid"
								alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>15 Days Tour</span>
							<h3>
								<a href="destination.html">Gurtnellen, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/destination-6.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-intro img" id="hotel-section"
		style="background-image: url(images/bg_4.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-9 text-center">
					<h2>Choose at $99 Per Night Only</h2>
					<p>We can manage your dream building A small river named Duden
						flows by their place</p>
					<p class="mb-0">
						<a href="#" class="btn btn-white px-4 py-3">Book a room now</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Suggested Hotel</span>
					<h2 class="mb-4">Find Nearest Hotel</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<div class="vr">
								<span>Sale</span>
							</div>
							<a href="hotel.html"><img src="images/hotel-1.jpg"
								class="img-fluid" alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">
								<span class="old-price mr-2">$500</span>$400
							</h4>
							<span>3 nights</span>
							<h3>
								<a href="hotel.html">Luxury Hotel in Greece</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/hotel-1.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="hotel.html"><img src="images/hotel-2.jpg"
								class="img-fluid" alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>3 nights</span>
							<h3>
								<a href="hotel.html">Luxury Hotel in Greece</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/hotel-2.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<a href="hotel.html"><img src="images/hotel-3.jpg"
								class="img-fluid" alt="Colorlib Template"></a>
						</div>
						<div class="text">
							<h4 class="price">$400</h4>
							<span>3 nights</span>
							<h3>
								<a href="hotel.html">Luxury Hotel in Greece</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/hotel-3.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
			</div>
			<div class="row justify-content-center pb-5 pt-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Rooms &amp; Suites</span>
					<h2 class="mb-4">Greece Best Rooms Offer</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 room-wrap">
					<div class="row">
						<div class="col-md-7 d-flex ftco-animate">
							<div class="img align-self-stretch"
								style="background-image: url(images/room-1.jpg);"></div>
						</div>
						<div class="col-md-5 ftco-animate">
							<div class="text py-5">
								<h3>
									<a href="hotel-single.html">Classic Balcony Room</a>
								</h3>
								<p class="pos">
									from <span class="price">$99.00</span>/night
								</p>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
									Separated they live in Bookmarksgrove right at the coast of the
									Semantics, a large language ocean. A small river named Duden
									flows by their place and supplies it with the necessary
									regelialia. It is a paradisematic country, in which roasted
									parts of sentences fly into your mouth.</p>
								<p>
									<a href="#" class="btn btn-secondary">Details</a> <a href="#"
										class="btn btn-primary">Book now</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 room-wrap room-wrap-thumb mt-4">
					<div class="row">
						<div class="col-md-3 ftco-animate">
							<a href="#" class="d-flex thumb">
								<div class="img align-self-stretch"
									style="background-image: url(images/room-1.jpg);"></div>
								<div class="text pl-3 py-3">
									<h3>Classic Balcony Room</h3>
								</div>
							</a>
						</div>
						<div class="col-md-3 ftco-animate">
							<a href="#" class="d-flex thumb">
								<div class="img align-self-stretch"
									style="background-image: url(images/room-2.jpg);"></div>
								<div class="text pl-3 py-3">
									<h3>Classic Balcony Room</h3>
								</div>
							</a>
						</div>
						<div class="col-md-3 ftco-animate">
							<a href="#" class="d-flex thumb">
								<div class="img align-self-stretch"
									style="background-image: url(images/room-3.jpg);"></div>
								<div class="text pl-3 py-3">
									<h3>Classic Balcony Room</h3>
								</div>
							</a>
						</div>
						<div class="col-md-3 ftco-animate">
							<a href="#" class="d-flex thumb">
								<div class="img align-self-stretch"
									style="background-image: url(images/room-4.jpg);"></div>
								<div class="text pl-3 py-3">
									<h3>Classic Balcony Room</h3>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section">
		<img src="images/blob-shape-2.svg" class="svg-blob"
			alt="Colorlib Free Template"> <img
			src="images/blob-shape-2.svg" class="svg-blob-2"
			alt="Colorlib Free Template">
		<div class="container">
			<div class="row justify-content-center pb-3">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<span class="subheading">Read testimonials</span>
					<h2 class="mb-4">What Client Says</h2>
				</div>
			</div>
			<div class="row ftco-animate justify-content-center">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img"
									style="background-image: url(images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text px-4 pb-5">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jeff Freshman</p>
									<span class="position">Artist</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img"
									style="background-image: url(images/person_2.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text px-4 pb-5">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jeff Freshman</p>
									<span class="position">Artist</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img"
									style="background-image: url(images/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text px-4 pb-5">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jeff Freshman</p>
									<span class="position">Artist</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img"
									style="background-image: url(images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text px-4 pb-5">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jeff Freshman</p>
									<span class="position">Artist</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center py-4 pb-5">
								<div class="user-img"
									style="background-image: url(images/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text px-4 pb-5">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jeff Freshman</p>
									<span class="position">Artist</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section" id="restaurant-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Restaurant</span>
					<h2 class="mb-4">Near Resturant</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<img src="images/resto-1.jpg" class="img-fluid"
								alt="Colorlib Template">
						</div>
						<div class="text">
							<h4 class="price">
								<span class="mr-2">menu start at</span>$4.00
							</h4>
							<span>Bern, Swetzerland</span>
							<h3>
								<a href="project.html">Resto Bar, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/resto-1.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<img src="images/resto-2.jpg" class="img-fluid"
								alt="Colorlib Template">
						</div>
						<div class="text">
							<h4 class="price">
								<span class="mr-2">menu start at</span>$4.00
							</h4>
							<span>Bern, Swetzerland</span>
							<h3>
								<a href="project.html">Resto Bar, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/resto-2.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 ftco-animate">
					<div class="project">
						<div class="img">
							<img src="images/resto-3.jpg" class="img-fluid"
								alt="Colorlib Template">
						</div>
						<div class="text">
							<h4 class="price">
								<span class="mr-2">menu start at</span>$4.00
							</h4>
							<span>Bern, Swetzerland</span>
							<h3>
								<a href="project.html">Resto Bar, Swetzerland</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
								<div class="float-right">
									<span class="rate"><a href="#">(120)</a></span>
								</div>
							</div>
						</div>
						<a href="images/resto-3.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section bg-light" id="blog-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Blog</span>
					<h2 class="mb-4">Our Blog</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-6 col-lg-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="single.html" class="block-20"
							style="background-image: url('images/image_1.jpg');"> </a>
						<div class="text float-right d-block">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day">12</span>
								</div>
								<div class="two">
									<span class="yr">2019</span> <span class="mos">april</span>
								</div>
							</div>
							<h3 class="heading">
								<a href="single.html">Why Lead Generation is Key for
									Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<a href="single.html" class="block-20"
							style="background-image: url('images/image_2.jpg');"> </a>
						<div class="text float-right d-block">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day">12</span>
								</div>
								<div class="two">
									<span class="yr">2019</span> <span class="mos">april</span>
								</div>
							</div>
							<h3 class="heading">
								<a href="single.html">Why Lead Generation is Key for
									Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 d-flex ftco-animate">
					<div class="blog-entry">
						<a href="single.html" class="block-20"
							style="background-image: url('images/image_3.jpg');"> </a>
						<div class="text float-right d-block">
							<div class="d-flex align-items-center pt-2 mb-4 topp">
								<div class="one mr-2">
									<span class="day">12</span>
								</div>
								<div class="two">
									<span class="yr">2019</span> <span class="mos">april</span>
								</div>
							</div>
							<h3 class="heading">
								<a href="single.html">Why Lead Generation is Key for
									Business Growth</a>
							</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
							<div class="d-flex align-items-center mt-4 meta">
								<p class="mb-0">
									<a href="#" class="btn btn-primary">Read More <span
										class="ion-ios-arrow-round-forward"></span></a>
								</p>
								<p class="ml-auto mb-0">
									<a href="#" class="mr-2">Admin</a> <a href="#"
										class="meta-chat"><span class="icon-chat"></span> 3</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact -->
	<c:import url="/common/Contact.jsp" />

	<!-- Map -->
	<c:import url="/common/Map.jsp" />

	<section class="ftco-gallery">
		<div class="container-fluid px-0">
			<div class="row no-gutters">
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-1.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-1.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-2.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-2.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-3.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-3.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-4.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-4.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-5.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-5.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-6.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-6.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Botton -->
	<c:import url="/common/Bottom.jsp" />

	<script src="js/main.js"></script>

</body>
</html>