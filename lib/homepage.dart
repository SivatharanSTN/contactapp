import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactapp/contact_detailpage.dart';
import 'package:contactapp/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  int selectedCard = -1;
  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  // int btnSelected = -1;
  Key alphKey = const Key('alpha');
  Key recentKey = const Key('recent');
  late Key selectedKey;

  @override
  void initState() {
    selectedKey = alphKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
          child: Column(
            children: [
              componentOne(context: context),
              componentTwo(context: context),
              componentThree(context: context),
              // cardDesign(context: context),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return cardDesign(context: context, indexNum: index);
                  },
                ),
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),

        floatingActionButton: Stack(
          children: [
            const SizedBox(
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 65.0,
              width: 65.0,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: const Color(0xff4287F6),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const ContactForm(),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget componentOne({required BuildContext context}) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            child: Text(
              "Hello Anatoly,",
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: const Color.fromARGB(218, 75, 75, 75),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10, bottom: 5, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: const FaIcon(
                    FontAwesomeIcons.arrowsRotate,
                    color: Color(0xff467DF5),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget componentTwo({required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        style: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: const Color.fromARGB(224, 85, 85, 85),
        ),
        decoration: const InputDecoration(
          // labelText: "Hello",

          hintMaxLines: 2,
          hintText: "Type a name, number, company, or keyword",
          hintStyle: TextStyle(color: Color.fromARGB(88, 58, 58, 58)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget componentThree({required BuildContext context}) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btn(
                  key: alphKey,
                  context: context,
                  textContent: "ABC",
                ),
                const SizedBox(
                  width: 20,
                ),
                btn(
                  key: recentKey,
                  context: context,
                  textContent: "Recent",
                ),
              ],
            ),
          ),
          Container(
            width: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.solidCircle,
                  color: Color(0xffFEAF00),
                  size: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                FaIcon(
                  FontAwesomeIcons.solidCircle,
                  color: Color(0xffE53F39),
                  size: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardDesign({required BuildContext context, required indexNum}) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectedCard == indexNum
              ? widget.selectedCard = -1
              : widget.selectedCard = indexNum;
        });
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => const ContactDetail(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            // color: Color(0xffFFFFFF),

            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CachedNetworkImage(
                        height: 55,
                        width: 55,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                indexNum == 0 || indexNum == 4
                    ? yellowNode(context: context)
                    : indexNum == 1
                        ? redNode(context: context)
                        : Container()
              ],
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alex Smith",
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: const Color.fromARGB(218, 75, 75, 75),
                    ),
                  ),
                  Text(
                    "CEO in Manterrey, MX",
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color.fromARGB(106, 75, 75, 75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btn(
      {required BuildContext context,
      required String textContent,
      required Key key}) {
    return InkWell(
      onTap: () {
        setState(() {
          // btnSelected = !btnSelected;
          // buttonSelected == index
          //     ? buttonSelected = -1
          //     : buttonSelected = index;

          selectedKey = key;
        });
      },
      child: Container(
        key: key,
        padding: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: selectedKey == key
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 255, 255, 255),
          // color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: selectedKey == key
                  ? const Color.fromARGB(202, 20, 20, 20)
                  : const Color.fromARGB(0, 54, 54, 54),
              blurRadius: 2,
              offset: const Offset(0, 1), // Shadow position
            ),
          ],
        ),
        child: Center(
          child: Text(
            textContent,
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: selectedKey == key
                  ? const Color.fromARGB(200, 44, 44, 44)
                  : const Color.fromARGB(108, 85, 85, 85),
            ),
          ),
        ),
      ),
    );
  }

  Widget yellowNode({required BuildContext context}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: const FaIcon(
          FontAwesomeIcons.solidCircle,
          color: Color(0xffFEAF00),
          size: 15,
        ),
      ),
    );
  }

  Widget redNode({required BuildContext context}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: const FaIcon(
          FontAwesomeIcons.solidCircle,
          color: Color(0xffE53F39),
          size: 15,
        ),
      ),
    );
  }
}