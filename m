Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F84EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:57:21 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.44])
 by mx.groups.io with SMTP id smtpd.web10.4205.1686905831991115574
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 01:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1252";
 spf=pass (domain: navimatix.de, ip: 40.107.13.44, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUGfwzF8Bt5p47pXp98A2ODiA3S3D+z4UYB4+2ueniFfAwwMwUbPfko7E4JOImf5wKL6GQf8TlUTlsa+Xxr5MGvHsPJ1Z6V+kvRiXBOdrI22BmauwPgyr4pHv5RXBrVoRNDG9ZwgGjfJ96Y6k/Ygu21c7NOb6E/bRPe8FNn8ny8isEmMx5sEm4e+Oy/YQzgNlYNKjvSYsRN+v41Bn9Amq9WpJO5x9HDOciHvp7zBzbzKL7oWm9cIeKcZ1VfkDLlCUdNJNWmcQYQ3iAfNdNSGNiH2CL03T9jUZo80Oxuds+wPxC+NaqzMvYDXkgtkqtf4cDfUarqQPto8IVvLWgTFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv+kVncbUilbYaEn47uZsfRCY3IslN7cpAV9eEsRmI4=;
 b=M6vCG0hnLqUoBWSvdmL8f8BvWMgBcwMe+pHLdA0xobmOuCpwgb2m/dYADaSP19ZJoIoSz0/FUVTuDejxsjAYfvI/+4GX6fX2saZe/856IkZSfSI0zcCF7WGKSF7cEp426CxhmizRA1TiXmKc/+qLhF/C52yrbe3COdBChHxbtXklXOS7eF2IUoQAy40oGDpkxJdRLBOm6980YBo/qVk33DB1haIn//GDsQNVCb/TEI+fxZ/Vj2r5KLbT/7pXu8qOO846TKYFlnliQ52b4V1TCFAjyjZ95bt2GARUn5LR9DFszR4JUXsAYBcox+mqaSnJ6J+XWWJXd0gGWDTuQ/lJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv+kVncbUilbYaEn47uZsfRCY3IslN7cpAV9eEsRmI4=;
 b=Usf42YCeoBECvM2oxVbLl9Em0BSJmj5EfcpbIxvWzo0AY2t/P3wdCme3GXwHDc/0Bgq7fm9R9VKiz8J7xRQrYrn/Wp5smRSdUIKXlEPHW+5ejdsiU8e3ZyRdprd93ucU6h6zg5YqWDOx6FIgOy5QitIa2FbAV0yFARzY4OKWVyw=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DB9PR01MB7483.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:217::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 08:57:08 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 08:57:08 +0000
From: =?Windows-1252?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: =?Windows-1252?Q?Suggestions_for_=BBIs_Yocto_Project_for_You=3F=AB?=
Thread-Topic: 
 =?Windows-1252?Q?Suggestions_for_=BBIs_Yocto_Project_for_You=3F=AB?=
Thread-Index: AQHZoDBK6iUdfZ4LckqgvPOnTXeC0g==
Date: Fri, 16 Jun 2023 08:57:08 +0000
Message-ID: 
 <VI1PR0102MB3136A1604EF41F78F1AD8BACFC58A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|DB9PR01MB7483:EE_
x-ms-office365-filtering-correlation-id: 4f8ac7f3-9eb7-4968-d2ac-08db6e47aa41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uC6Eg2yzIC0TezMQVrhFNJI6xmdz38TzPQEZIAZsM9nd0ANn4PqpJrotw64YIqZuxlA8ecGK/lP8hyS5798az/26vkpiADup4hW7qArWjytIPEJ5M2kqhY4Fv9cnq0BgHY9B5NO6bUBT6BycPxmnBrMZ3JOanqmIkSYXs73mH47k6cX5mpihIFi4VwGpEbtjQ12b3fkasb1pPdtZk6NoKdmKp8LVkzqvHWhJ/xQFwfUUiByyQZ5s9sk8bhefKUodx1aFCJBkcan+JLvZg51j00bKQxgyFBB9ZVvrI8x3CbTLkWf74qjlozTmhv8PhYotaEu/UPazzBwPVNycXx20I0qBTCFZj7gUy+cElpv3aM7/0rXRQ+ITv0NR93pFty/ENk18RK18Z6IEfK/+f3sxc2Yrss4nXWmicc34tsh4LOm3ET7KgcDhmtNYaICNw+3EoeChIVE/H2t0TvV5z/hMQwhpFO6qqYOavi4pyZza81GajOwbdE8NcBH4cpExSlLiFoYVeIHBp0432WNjTmVf4qPNDxW3Ii4ghjRahO7mL4aD/8Y4E8Tcnitsyd3kVhcqHDBreeF0/yvlkJ2ON+TgrMVbZQdB2IPv+YvDVcVxwNw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199021)(122000001)(508600001)(38100700002)(166002)(64756008)(71200400001)(66556008)(66946007)(6916009)(66476007)(76116006)(66446008)(38070700005)(7696005)(316002)(8936002)(41300700001)(966005)(52536014)(5660300002)(6506007)(26005)(91956017)(86362001)(2906002)(19627405001)(55016003)(83380400001)(66574015)(186003)(9686003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?VkQNCsXq90KSVXA7E2kfQDbejcSOOG0PGuEtFgBzDKv6cG9mBLM4DP3A?=
 =?Windows-1252?Q?rFLBOcPdpTvgPF8w3iEws7EICvChUS0Epbd8fd+lLNU2RoeQIBM2SgmA?=
 =?Windows-1252?Q?rOGkwenufKqbcMo8YW4K/RqTXf5vyvFBYlwWHk5i+Qd97GF0ZCweQW9l?=
 =?Windows-1252?Q?jFeR2cyRCloqr8CpxBCBAp26n+kOnRj2y3PvJi/yEdqu54rxRzp18Bkf?=
 =?Windows-1252?Q?ebC7+TqbkFiXzkXtP92owZKVnZAjEiYxHOLoDrAZGG6Qjupha9YbPsW8?=
 =?Windows-1252?Q?O8OGGHZmTgbqsGD7bWjMDeEtBee1OWfV/XB+LCfQLmHLM7OJIxjcZNiJ?=
 =?Windows-1252?Q?InDrPxOaRWprr9YAwZlcTY0Mhdb1iHA5/oGJ1ivRNKxpQbWOwXjnXYLs?=
 =?Windows-1252?Q?l0v8YSXR+heVRgVUFX5y2HGXolbeJ2FpF0AUKepIL2EffLo8jvmnocJq?=
 =?Windows-1252?Q?pky8/4bz8JOb06TKdUY9mofR+l7MUbnxNQzNxeTRd+wHAAhCTSLegulU?=
 =?Windows-1252?Q?G/mprFeiFA58LvbfaZNxJs4aPevjk2xcoMf/WPoLxRw1/rJHGjce5KVd?=
 =?Windows-1252?Q?jO7lBrUAuTeK73RAVmdD7E8hFrJUYqK/v4YypQHBbfZ4s3uu02V7rr/M?=
 =?Windows-1252?Q?nXgVJM6Kd0b6RQLKHBWCLi9/bRuZED1XDzwBLm7ERT8QtLqatHdkMRat?=
 =?Windows-1252?Q?/JydnSz3Sk4AivP28H3OiR4nocm2DJorCj69LXgk9wzmcKZh57ZrLydo?=
 =?Windows-1252?Q?sPm0RCM1KT9m/x1WHuEcMaZK796Yzgy7FnTyQj0xnZ2PgLvwuaKZ1mmq?=
 =?Windows-1252?Q?fQrmNJ3cwP1feYHH+JprE1ymXZnQSgWsfk8Kew8jw/fFL76adlxJK13p?=
 =?Windows-1252?Q?z9HakDLc6i0sbEktDSyb1N0xB2pbXvFF3dWxhLt5nEeqSClTw6OAnSOZ?=
 =?Windows-1252?Q?G+plZ7mUKyFWdQQ1Y9bsvSMGN5q93JKsHdQ3w8hv51jitJikKHqDRbhl?=
 =?Windows-1252?Q?n+i1uOS89F5EP89BoL/i/PeAws9vuPv2ldAoGwh9QxIp9YtYr/d4VMmF?=
 =?Windows-1252?Q?RGnnYliw8aL4HBMbSQzPA8ZdhP5Rgfhgr2kmZagm9fW9eQP4ZSBMcA/P?=
 =?Windows-1252?Q?VYd7h60Y2h7oBOV4WMcCz9FcwcoDBLvR/HQjGap/0ABeiiaOmCW0pSDH?=
 =?Windows-1252?Q?mw7HNAt3mte5VKmSh5zh1EiXVpkcO/1ukpmddMRGDN/rGdqLpYlRRWOk?=
 =?Windows-1252?Q?6yuLT9UAsagC1QtnAKcu2XcXbP7SFqvTEYh4Au2QWRCtP3Vj5dAwTiJE?=
 =?Windows-1252?Q?BToHayEWn4+kmHvEKsd9V4ryt+WBSxfg8mOsJXfYjXKuQJZeO0oX71YV?=
 =?Windows-1252?Q?NPVR4pCxOR21y61f61j9qUz1K2LV0XTDBhmmKNqjtsw9siIFxnevmUjy?=
 =?Windows-1252?Q?asDJb+bILvuHkapZSSgJ49IGPMLIwgSBpXBWdnUB0VDDB86vIq4zM18x?=
 =?Windows-1252?Q?NP6Ou9BoS2TtHzPzg/oKyUtt0vdp6odVR5SuE2tlGv1//2krRlv64Jj5?=
 =?Windows-1252?Q?MPj/Ku7GNXHJHRLDlXtNCCrrVH6lAfmjadlx4pRbjLciCPB1xUb34YHN?=
 =?Windows-1252?Q?T+39+YsFXC1iReO39Y6for9VLESGfIrlDJCSwcih/1uf/OIWdd+d6jwf?=
 =?Windows-1252?Q?gJTHuWTx7lnhuWelcMi6A+uDKXLHbK6K?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0102MB3136A1604EF41F78F1AD8BACFC58AVI1PR0102MB3136_"
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8ac7f3-9eb7-4968-d2ac-08db6e47aa41
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 08:57:08.1032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xOcplPrr8w5tp8u5G96epDkByhJ6696IAC4nMDsnPaSm+Tf29iK1lmnt3VM7SH3H1PeAyXQbk/Ro65e2Hnc4To+9IJsRvcxlsnNmASOmws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7483
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Jun 2023 08:57:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4000

--_000_VI1PR0102MB3136A1604EF41F78F1AD8BACFC58AVI1PR0102MB3136_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I went through the Yocto documentation and read https://www.yoctoproject.or=
g/is-yocto-project-for-you/. I saw some points for improvement and would li=
ke to share them:


  *   In =BBPlus if you tire of maintaining your own Linux distribution=AB =
should be a comma after Plus and I would phrase the sentence this way: =BBP=
lus, if you are tired of maintaining your own Linux distribution=AB
  *   After the heading of point 5, 6, 9, and 15 a line wrap is made while =
after the other headings it's not.
  *   After the heading of point 2, 7, and  12 a space character is missing
  *   In =BBcustomize any as needed.=AB I think anything would match better=
: =BBcustomize anything as needed.=AB
  *   In =BBis designed so that you only add what you want or packages as n=
eeded without having to remove=AB something is missing after or: =BBis desi=
gned that you only add what you want or use packages as needed without havi=
ng to remove=AB
  *   Here =BBto get started quickly but=AB is a comma missing before but =
=BBto get started quickly, but=AB
  *   In =BBcommunity manager has said, =93Nothing=AB I would use a colon t=
o separate the quote =BBsaid: =93Nothing=AB
  *   In =BBRaspberry Pi or the BeagleBone, or MinnowBoard=AB is a comma mi=
ssing before or =BBRaspberry Pi, or the BeagleBone, or MinnowBoard=AB
  *   The sentence =BBexperienced Yocto Project developers are sought the w=
orld over=AB I would write as =BBexperienced Yocto Project developers wante=
d worldwide=AB

If there's git repo for the web page, I can send a patch/PR if you like.


Kind regards


J=F6rg Sommer

Software Developer / Programmierer

--

Navimatix GmbH

Tatzendpromenade 2

07745 Jena

T: 03641 - 327 99 0

F: 03641 - 526 306

M: joerg.sommer@navimatix.de

www.navimatix.de<http://www.navimatix.de/>


Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley

Registergericht: Amtsgericht Jena, HRB 501480



- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


Diese E-Mail k=F6nnte vertrauliche und/oder rechtlich gesch=FCtzte Informat=
ionen enthalten. Wenn Sie nicht der richtige Adressat sind oder diese E-Mai=
l irrt=FCmlich erhalten haben, informieren Sie bitte sofort den Absender un=
d vernichten Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte We=
itergabe dieser Mail sind nicht gestattet.


This e-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this e-mail in error) plea=
se notify the sender immediately and destroy this e-mail. Any unauthorised =
copying, disclosure or distribution of the material in this e-mail is stric=
tly forbidden.


--_000_VI1PR0102MB3136A1604EF41F78F1AD8BACFC58AVI1PR0102MB3136_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, san=
s-serif, serif, EmojiFont; color: black;" class=3D"ContentPasted0">Hi,</spa=
n>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;">
<br class=3D"ContentPasted0">
</div>
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;" class=3D"ContentPasted0">
I went through the Yocto documentation and read <a href=3D"https://www.yoct=
oproject.org/is-yocto-project-for-you/" target=3D"_blank" rel=3D"noopener n=
oreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0" class=3D"Conten=
tPasted0">
https://www.yoctoproject.org/is-yocto-project-for-you/</a>. I saw some poin=
ts for improvement and would like to share them:</div>
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;">
<br class=3D"ContentPasted0">
</div>
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;" class=3D"ContentPasted0">
<div><span dir=3D"auto">
<ul>
<li class=3D"ContentPasted0">In =BBPlus if you tire of maintaining your own=
 Linux distribution=AB should be a comma after Plus and I would phrase the =
sentence this way: =BBPlus, if you are tired of maintaining your own Linux =
distribution=AB</li><li class=3D"ContentPasted0">After the heading of point=
 5, 6, 9, and 15 a line wrap is made while after the other headings it's no=
t.<br class=3D"ContentPasted0">
</li><li class=3D"ContentPasted0">After the heading of point 2, 7, and&nbsp=
; 12 a space character is missing</li><li class=3D"ContentPasted0">In =BBcu=
stomize any as needed.=AB I think anything would match better: =BBcustomize=
 anything as needed.=AB</li><li class=3D"ContentPasted0">In =BBis designed =
so that you only add what you want or packages as needed without having to =
remove=AB something is missing after
<i class=3D"ContentPasted0">or:</i> =BBis designed that you only add what y=
ou want or use packages as needed without having to remove=AB</li><li class=
=3D"ContentPasted0">Here =BBto get started quickly but=AB is a comma missin=
g before
<i class=3D"ContentPasted0">but</i> =BBto get started quickly, but=AB</li><=
li class=3D"ContentPasted0">In =BBcommunity manager has said, =93Nothing=AB=
 I would use a colon to separate the quote =BBsaid: =93Nothing=AB</li><li c=
lass=3D"ContentPasted0">In =BBRaspberry Pi or the BeagleBone, or MinnowBoar=
d=AB is a comma missing before
<i class=3D"ContentPasted0">or</i> =BBRaspberry Pi, or the BeagleBone, or M=
innowBoard=AB</li><li class=3D"ContentPasted0">The sentence =BBexperienced =
Yocto Project developers are sought the world over=AB I would write as =BBe=
xperienced Yocto Project developers wanted worldwide=AB</li></ul>
</span></div>
If there's git repo for the web page, I can send a patch/PR if you like.</d=
iv>
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;">
<br class=3D"ContentPasted0">
</div>
<div>
<div style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, sans=
-serif, serif, EmojiFont; color: black;">
<br class=3D"ContentPasted0">
</div>
<div>
<div>
<div><font style=3D"color: rgb(64, 64, 64);"><span class=3D"ContentPasted0"=
 lang=3D"de-DE">Kind regards<br class=3D"ContentPasted0">
</span><span lang=3D"de-DE"><br>
</span></font></div>
<div><font style=3D"color: rgb(64, 64, 64);"><span class=3D"ContentPasted1"=
 lang=3D"de-DE">
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font><span class=3D"ContentPasted1" lang=3D"de-DE">J=F6rg Sommer<br class=
=3D"ContentPasted1">
</span></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" class=3D"ContentPasted1">
<font><span class=3D"ContentPasted1" lang=3D"de-DE">Software Developer / Pr=
ogrammierer</span></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" class=3D"ContentPasted1">
<font><span class=3D"ContentPasted1" lang=3D"de-DE">--&nbsp;</span></font><=
/p>
</span></font></div>
<table id=3D"tableSelected0" width=3D"586">
<tbody>
<tr>
<td style=3D"border:none;padding:0in" width=3D"184" valign=3D"top">
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif; margin-right: -0.17in;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">Navimatix GmbH</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif; margin-right: -0.07in;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">Tatzendpromenade 2</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0.1in; background: transparen=
t; font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">07745 Jena</span></font></font><font style=3D"c=
olor: rgb(64, 64, 64);"><font style=3D"font-size:9pt" size=3D"2"><span lang=
=3D"de-DE"> &nbsp;</span></font></font></p>
</td>
<td style=3D"border:none;padding:0in" width=3D"220" valign=3D"top">
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">T: 03641 - 327 99 0</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">F: 03641 - 526 306</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">M:
</span></font></font><font style=3D"color: rgb(5, 99, 193);"><u><font style=
=3D"font-size:10pt" size=3D"2">joerg.sommer</font></u></font><font style=3D=
"color: rgb(5, 99, 193);"><u><a><font style=3D"font-size:10pt" size=3D"2"><=
span lang=3D"de-DE">@navimatix.de</span></font></a></u></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(5, 99, 193);"><u><a href=3D"http://www.navimatix.=
de/" data-loopstyle=3D"linkonly"><font style=3D"font-size:10pt" size=3D"2">=
<span lang=3D"de-DE">www.navimatix.de</span></font></a></u></font></p>
</td>
<td style=3D"border:none;padding:0in" width=3D"139">
<p style=3D"line-height: 115%; margin-bottom: 0.1in; background: transparen=
t; font-family: &quot;Calibri&quot;, serif;" lang=3D"de-DE">
<br>
</p>
</td>
</tr>
<tr>
<td colspan=3D"3" style=3D"border:none;padding:0in" width=3D"572" valign=3D=
"top">
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif; margin-right: -0.17in;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Romm=
eley</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif; margin-right: -0.17in;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:10pt" size=
=3D"2"><span lang=3D"de-DE">Registergericht: Amtsgericht Jena, HRB 501480</=
span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" lang=3D"de-DE">
<br>
</p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" lang=3D"de-DE">
<br>
</p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:8pt" size=
=3D"1"><span lang=3D"de-DE">- - - - - - - - - - - - - - - - - - - - - - - -=
 - - - - - - - - - - - -</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" lang=3D"de-DE">
<br>
</p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:8pt" size=
=3D"1"><span lang=3D"de-DE">Diese E-Mail k=F6nnte vertrauliche und/oder rec=
htlich gesch=FCtzte Informationen enthalten. Wenn Sie nicht der richtige Ad=
ressat sind oder diese E-Mail irrt=FCmlich erhalten
 haben, informieren Sie bitte sofort den Absender und vernichten Sie diese =
Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe dieser Mail si=
nd nicht gestattet.</span></font></font></p>
<p style=3D"line-height: 115%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;" lang=3D"de-DE">
<br>
</p>
<p style=3D"line-height: 115%; margin-bottom: 0.1in; background: transparen=
t; font-family: &quot;Calibri&quot;, serif;">
<font style=3D"color: rgb(64, 64, 64);"><font style=3D"font-size:8pt" size=
=3D"1"><span lang=3D"en-GB">This e-mail may contain confidential and/or pri=
vileged information. If you are not the intended recipient (or have receive=
d this e-mail in error) please notify the
 sender immediately and destroy this e-mail. Any unauthorised copying, disc=
losure or distribution of the material in this e-mail is strictly forbidden=
.</span></font></font></p>
</td>
</tr>
</tbody>
</table>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent;=
 font-family: &quot;Calibri&quot;, serif;">
<br>
</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_VI1PR0102MB3136A1604EF41F78F1AD8BACFC58AVI1PR0102MB3136_--

