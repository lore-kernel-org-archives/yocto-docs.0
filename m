Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web12.149.1627384987484729881
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 04:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=X3mpLmAR;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.65, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB7CLv4kJg5zPlZFyyu3vUh5CLS0Kq5QbY5mkBXzq0MrA9TpXNSqT6AxN8nuZO9RlmL/ELc5rzFmBoREvLuppeNvrx7O+LNqa6JtD6kQmFKHlwEB8VHk7dWzR4BY5Dhc0+xlm9P/Qcf0x4KFWtSasjLMKa7hNfgNOL4ZbM1NIBzyB71tC4EvY3ErX5N3M7IO9nKuJgrA6l3lQMs1Tvqe4RrwEyvnfmUgXS4NgMKVwtkabZUPZEqrJ4DCcvUk7OTY7a+WN3wFjVcLKT1v7TigmHY/wtQ55o7IadbTNygNZyFXbx2CxezrjbEA8X9wbURdd6Od7aUgzrlG6/KKDNr3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOMaXn20EaMJL5Zp+db7/s8DTndstmzBfvR5NOsEEIo=;
 b=MYQaFMlamn70Sm1mosBoFmKDYNDcg9/HQV9PwKFl6Wme5B9zfoA8MOlEzWU2BtpeJIE+zkAvVm9IqJusXMO53CkUvbXDuN/7+2cAFUAPSLzsh0TZbglS09WkQqlrW94RZgs/GZ/Q6nE88ANzBxs2ErAoEEfKOm7qNi0EWzms9zY2UvbBuGwNYUCxqvAb3Nadz7T6L/KJ/Ak+MI18JCYU6PNDVHTemnQuJSREs1X2eE4IezO3hAvkHth56/IfDSDWwnWjWagY8K0cNo0FSLEoFNMTaZ4hSYNtJMpcY7niBIk8v686diz8X0sX+YPqwidPKBfeIhCoTTPu2TvIEHCILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOMaXn20EaMJL5Zp+db7/s8DTndstmzBfvR5NOsEEIo=;
 b=X3mpLmAR1GIbD9qJiLSk9iVwURTSquJbBqm55ofVNXT665s5wPO5ZGYlwB4iw4Yz3Wzrt0zcRUI5amPGGrktraOGP6EY6xZ9Oz11c7ZNZ1OczAG6SGU2NA7GVtYSC2/YiGPor4D23OsKyiOjhztnaBJTBmt3Bf5uuISKHztpdiA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7075.eurprd04.prod.outlook.com
 (2603:10a6:208:19e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 11:23:04 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 11:23:04 +0000
Date: Tue, 27 Jul 2021 13:23:02 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH] ref-manual: remove unused example recipe source files
Message-ID: <20210727112302.spzqyqnu3k2sskxi@fedora>
References: <16959EEB5BD85597.12821@lists.yoctoproject.org>
 <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
In-Reply-To: <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR02CA0213.eurprd02.prod.outlook.com (2603:10a6:20b:28f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 11:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58080aea-1d23-4ca5-23b3-08d950f0e6b9
X-MS-TrafficTypeDiagnostic: AM0PR04MB7075:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7075FEE50ED1E565EB502CCFC2E99@AM0PR04MB7075.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iJKZ9X9sVcWCLdWvauRUmgtbArBXkMhB/BlfUCHA6wpHw4GRV6DZDmxGF9w/gI/RRZQgYJyM6OjLbu4SlK2WU3H8I8XWJbBR7uZrinnqKh1tgKUn1icUJLgMyf0a74T+uB1InuX2Utu0WwwK1znmTgfiLtTU/fMW5xFlFrh/EwFRmDO28bUwPCJQe2/JutMdSTvhhffGCN/T//LU53HH8fneajFJx1EIgRFAKgRthQTb9547c/Xa7AcxM/uVXeqAfNI7mB6FR4nRI4jg4O0reGqU6KNRJZDOuGWRIL9xmE7bFbNweyRD79mKCfwJ2L5H2woUB2xFsb2xlO9NVBsAb7Z0GmCNP31JGdGr/n/o1WazWicR/ZMb12cpUwBeruyC9hXIkJ8rAtdgyh4GS8TK2ny2dmoM2mqMWD/p/m9SvjrETGvxnPT+GiiMrkIgtyO9H6DzU1xCMfJD5iVZoYhV9nCRvoV/biakMFCB0qgdbdL+haLPiEGTsWlObeGn6YXsydI6JgWEPleegRyY9XWogFr6F+EdIxgICLriTG5BNoennhzD3Jtmw5RjbKLVgnThBC3DPHo1KQNUi2bTiMJfiAyZX1KbEIKpDGanFI0u80bXXi2c8d7YmW4DZUusgliMfL3iG3EIc9aGVj7iDyusQja7n22kq55fhLJ3RUzr6pwvRgE4CnTZo4jzZtbE4k1xUW7CFNOXlLz7Eaj++S8sc0Sv/DEUcc3jzHFvaZGus+bQ1+j2LvKJ5L+orn9IwDjxczJuRSVSSuW/3NWHuI35uj/M0D5sQL1aU+zNAPJJYAI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39840400004)(136003)(396003)(55016002)(9686003)(38100700002)(33716001)(83380400001)(66556008)(66476007)(44832011)(86362001)(5660300002)(478600001)(186003)(26005)(956004)(52116002)(8676002)(9576002)(2906002)(8936002)(6916009)(66946007)(6496006)(38350700002)(1076003)(53546011)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wQv9uOPUO5fbyWlYNKkxBUXBWQHhY+kI2x06OGzAyJaJGI3kchMNGarIWpWt?=
 =?us-ascii?Q?8IAbpwkCxaBK3gaYc4DPiABGZAefjOxfYXw1Od8yOKOSA/awkYftfx5aQGVX?=
 =?us-ascii?Q?v7BhbkGZaqkWKNRiHsm4PO9dHOIzjIIteuI3goALN4OO6UxUdkOA4FV3kLwp?=
 =?us-ascii?Q?6YzWgYKGm8+WM+EL/Hz0T+1zA//6ETpF+whbFyy76yzSUHpucQHInLlVeoZZ?=
 =?us-ascii?Q?3Vzl6Kvg4Ad528R6WI74kq9dxp8FXL+L+omimozERHo/hm5ji335vJyNLGRy?=
 =?us-ascii?Q?LJqONe1ZxHev5W6kjn0/ZNxk+2rwdjSdkYtL7IWtoopQ0hrdRAjamjMObkqb?=
 =?us-ascii?Q?a4KVJrw+ACY3jLJN/eam3AvYfXl5lbhQTBlULZD4tJKSg0Ma5E1VJuqkEe88?=
 =?us-ascii?Q?I5KcHCpyxshXVE7QDztgY3mzVntxZa6qagppkH/0zaOdQfj4UGPMiEJ55D3U?=
 =?us-ascii?Q?+/qUbaEhHauRH8Kl9spDak4OpA+uMtsjqS+BGvKKJXVuM6VkA60AKEmCyKOc?=
 =?us-ascii?Q?0ZPZg2Y1NkE34o8EA5QmKMgA03EONI9I53axane7c0ABNiyz9xkFP04ukREc?=
 =?us-ascii?Q?I6evuT67dGo3tvsc4too3t5tVTb7LTRXUSb61WqVEYuyygso3gSIqVAUpWDm?=
 =?us-ascii?Q?h1Z5mSm6AubNP71U/wieuxBHQhnpm6q+gc7d8MvfVSmiERLbRm9HD3alXd4A?=
 =?us-ascii?Q?dlAgaf8CUcUPhAbNxUbAcOgOxeICCJtEMlTP0rga5Z+B1EHWH7L2IJSZPFfA?=
 =?us-ascii?Q?rcdeiPswK0/7AdVU55tUra8uPx9yAQ2jBGIi01aPC7Dp5fuUsh+CEwvNGM8O?=
 =?us-ascii?Q?ZVujZMzrlE5TcC+/d8KdAqFsjmu1F6nPrwZ0Fr9jy759fHX2LJMHUVDZB76d?=
 =?us-ascii?Q?UxdeMiXxaWYrnZqwuPL0PNA908rpnMBrWxVu2QURRSpxOTH7fzgqkwiJVj3e?=
 =?us-ascii?Q?26dXBjAcf6ivuL6jKqkDBnxpMCf8WqSnh8CrlsyN/r6zX78h7a9v3O2O1awi?=
 =?us-ascii?Q?DWi/4EiBYzdTWTf03J9wus6mRZzkpLFlcJregP9rpB/HRBCQWoAKXJpVsG21?=
 =?us-ascii?Q?QMM9wY7RXoJvwke2D3tKrkUVajlm6uHY/s1klPVI7Iwf0UzN5U2XoymVP8MZ?=
 =?us-ascii?Q?iNGG/RxSsEyT6QpM5QKsxTjBb5KLcLv4X+p5mgzphiOL8uaUwipp6tJjv601?=
 =?us-ascii?Q?h3Vnytihbq+fhig4TXpfK8niI2hKYGBmlaF5gfUxlbdv6G4QntIS/wXd9x8A?=
 =?us-ascii?Q?FsKoDJ07xY+5lLbT5uBulB+QoS3uJsr5H+/fVZMCQ3nTMpNho0oLklT10ODY?=
 =?us-ascii?Q?JRn7YEIAJOKFAJjhd9Mq/qiE?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58080aea-1d23-4ca5-23b3-08d950f0e6b9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 11:23:04.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgniZiTDi3liRY2cKpcZr8aVFeoqfIUOgw6X+f3UHczWA0QsuWZAOzdAwwEUpW6hqEuF2sxfjaWdb4sa+Q/M2VjOhkFSAe2bQr3u/VdiNtsxiTndF9qmU9GAj5XOkrkv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Jul 27, 2021 at 12:29:41PM +0200, Michael Opdenacker wrote:
> Hello Quentin,
> 
> On 7/27/21 12:26 PM, Michael Opdenacker wrote:
> > These files are not used to build to documentation
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  .../examples/hello-autotools/hello_2.10.bb      |  9 ---------
> >  .../examples/hello-single/files/helloworld.c    |  8 --------
> >  .../ref-manual/examples/hello-single/hello.bb   | 17 -----------------
> >  .../ref-manual/examples/libxpm/libxpm_3.5.6.bb  | 14 --------------
> >  .../examples/mtd-makefile/mtd-utils_1.0.0.bb    | 15 ---------------
> >  5 files changed, 63 deletions(-)
> >  delete mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> >  delete mode 100644 documentation/ref-manual/examples/hello-single/files/helloworld.c
> >  delete mode 100644 documentation/ref-manual/examples/hello-single/hello.bb
> >  delete mode 100644 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> >  delete mode 100644 documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> >
> > diff --git a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb b/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> > deleted file mode 100644
> > index aa2beb9a9b..0000000000
> > --- a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -DESCRIPTION = "GNU Helloworld application"
> > -SECTION = "examples"
> > -LICENSE = "GPLv3"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > -
> > -SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
> > -SRC_URI[sha256sum] = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
> > -
> > -inherit autotools-brokensep gettext
> > diff --git a/documentation/ref-manual/examples/hello-single/files/helloworld.c b/documentation/ref-manual/examples/hello-single/files/helloworld.c
> > deleted file mode 100644
> > index fc7169b7b8..0000000000
> > --- a/documentation/ref-manual/examples/hello-single/files/helloworld.c
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -#include <stdio.h>
> > -
> > -int main(void)
> > -{
> > -	printf("Hello world!\n");
> > -
> > -	return 0;
> > -}
> > diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
> > deleted file mode 100644
> > index 90d3aefd86..0000000000
> > --- a/documentation/ref-manual/examples/hello-single/hello.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION = "Simple helloworld application"
> > -SECTION = "examples"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > -
> > -SRC_URI = "file://helloworld.c"
> > -
> > -S = "${WORKDIR}"
> > -
> > -do_compile() {
> > -	${CC} ${LDFLAGS} helloworld.c -o helloworld
> > -}
> > -
> > -do_install() {
> > -	install -d ${D}${bindir}
> > -	install -m 0755 helloworld ${D}${bindir}
> > -}
> > diff --git a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> > deleted file mode 100644
> > index c0c8986405..0000000000
> > --- a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -require recipes-graphics/xorg-lib/xorg-lib-common.inc
> > -
> > -DESCRIPTION = "X11 Pixmap library"
> > -LICENSE = "X-BSD"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
> > -DEPENDS += "libxext"
> > -PR = "r2"
> > -PE = "1"
> > -
> > -XORG_PN = "libXpm"
> > -
> > -PACKAGES =+ "sxpm cxpm"
> > -FILES_cxpm = "${bindir}/cxpm"
> > -FILES_sxpm = "${bindir}/sxpm"
> > diff --git a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb b/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> > deleted file mode 100644
> > index 5d05a437a4..0000000000
> > --- a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -DESCRIPTION = "Tools for managing memory technology devices."
> > -SECTION = "base"
> > -DEPENDS = "zlib"
> > -HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.linux-2Dmtd.infradead.org_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=eyb4BYFT9E-HdgVPGQm8pJMdNlXGefc8FzxjWoAmrcs&s=rDxXZI7Evhz9_J8vJmFmp7sfSRycLIHpvHm2-rhxYYQ&e= "
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> > -                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> > -
> > -SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=ftp-3A__ftp.infradead.org_pub_mtd-2Dutils_mtd-2Dutils-2D-24-257BPV-257D.tar.gz&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=eyb4BYFT9E-HdgVPGQm8pJMdNlXGefc8FzxjWoAmrcs&s=iW6rRvnv1zLX6sYtZjtYVLji9LdaUjp64SzvLGJhKC0&e= "
> > -
> > -CFLAGS_prepend = "-I ${S}/include "
> > -
> > -do_install() {
> > -	oe_runmake install DESTDIR=${D}
> > -}
> >
> 
> This is probably a controversial commit. Rather than asking a question,
> I preferred to send a patch.
> 
> Apparently, you were the last one to touch these files, so don't
> hesitate to stop me and let us know why we should keep these files.
> Maybe to make sure that our examples still compile? However, I found at
> least one file that is not in sync with the contents of the documentation.
> 

I wouldn't remove them as I find example recipes to be very welcomed as
real life examples of what can/needs to be done. It shows also some
gotchas and what a minimal recipe should look like.

What I have to complain about those files currently is that they are not
built and they weren't working for a while, which is a bit of a shame
for example recipes :)

I don't think keeping them in the yocto-docs is something we want to
push for (at least I won't), but I feel like we should keep them
somewhere they are built so we maintain them along other recipes.

I can see that we have a recipe for an out-of-tree kernel drievr recipe
available in poky/meta-skeleton layer (called hello-mod). I guess this
is a place we could put the examples you want to remove from yocto-docs?

Cheers,
Quentin
