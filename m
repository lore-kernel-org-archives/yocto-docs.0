Return-Path: <mirandamiguela2@johndeere.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCD7C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 22:24:16 +0000 (UTC)
Received: from mx0a-000e4101.pphosted.com (mx0a-000e4101.pphosted.com
 [67.231.144.73])
 by mx.groups.io with SMTP id smtpd.web11.3799.1645223054697197922
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 14:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@johndeere.com header.s=s1-feb19 header.b=SRssFNKq;
 spf=pass (domain: johndeere.com, ip: 67.231.144.73,
 mailfrom: prvs=0048b702ef=mirandamiguela2@johndeere.com)
Received: from pps.filterd (m0093294.ppops.net [127.0.0.1])
	by mx0a-000e4101.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21IHXHOB007393
	for <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 16:24:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johndeere.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=S1-Feb19;
 bh=6iKGz3uPysDb4JpRAXUM8K+6o6+LAWa2mDeP5MZJfds=;
 b=SRssFNKqHkXQ+sJh6raOxZn1PdhVGDatIC5bZK0RFlrsZpJVkXB0wFS21HTBjCjHjyas
 1fYfiq1/6mK6gWmpLO2qjd5Y3sVQu0IXvuy8+ChvqEDq1PG1q9QTZocEGg8uMaUmVk9/
 tjBDOlYGERy77VWGSpyZt2aI63PLgALrtpHjspnf2/7rcXQUi0CNUABfCx0aDP/nT2bV
 tfkaPDACgvJ4ThCF37eZi8tH8oy9PL65GWrJoDjzshwm3fBimtAC8qt7mq0xV8zbCY+Q
 UE1eFFRtIgHJvkm63I743Ua5Uw+dPuj08tHd47eryrOR/vZTaqisGN6EUpSkwbivMoq+ 8Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-000e4101.pphosted.com (PPS) with ESMTPS id 3eafy61kj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 16:24:13 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAlU/q4vcjC/64EiydX9QBzeKlswO/xKLgIt7isJOY0KCTcTpSM61m2IOfCp73v/9p66KPHapAv5XaL+rzINFKvCL2eUwbqXRudse+bMCuA5LuIeMpJYSqFICs7vhJ8LhvIH1CE8q3tzROgAr3da8D4isBmA2633ltfTK/Ad9NzQvVuKJnz34CIIukM6PkiHvTxrMD6/faizsPxJAQelzGyxpw7ZAq02sAqRqneTTWGuXHz45eNuSz74eJqiqaEynsFYhCRkfwEYuQ2agMrM1xDXaEX3I7Gg+I3SBtpm131H2qI+6JK0TugBJXOsxfEuHnluTOnrxzf5BLGSu8Y64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iKGz3uPysDb4JpRAXUM8K+6o6+LAWa2mDeP5MZJfds=;
 b=HObsQBrOsVy4lPGYp2BNv+X1D+sIvxtvfXM1iqSNJ3IFgbRFqs8bB/4QC5y7zn9Rh7Mm5gluQ2zBnerPx0J7HZ1EzH1vErLGd3Y6U1AbxsQrVPtwHWaggC4mnzW9R25OrB+QvaFcMJETdZVj7mSviG+f0P1gB85gmRMu8GIkghQmqJRPP+poJTG3POkDhoXJMJMrB81k8ylVPSHna+d+QgqPbl7lslv/HsSjFDVMQYeMX/PiWTOJqF5HyhWO6ONVT1U5RAfqF6irsE1N+f9bvgTKcAQEip6JHDHEOmQwkIFPNP1yQBy52LsGP8Pxh1vKYK6pNZG43k/DQiMBRotSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=johndeere.com; dmarc=pass action=none
 header.from=johndeere.com; dkim=pass header.d=johndeere.com; arc=none
Received: from SN6PR05MB5710.namprd05.prod.outlook.com (2603:10b6:805:f8::28)
 by SA1PR05MB8802.namprd05.prod.outlook.com (2603:10b6:806:1cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.9; Fri, 18 Feb
 2022 22:24:10 +0000
Received: from SN6PR05MB5710.namprd05.prod.outlook.com
 ([fe80::440f:9a9d:16df:1058]) by SN6PR05MB5710.namprd05.prod.outlook.com
 ([fe80::440f:9a9d:16df:1058%4]) with mapi id 15.20.4995.008; Fri, 18 Feb 2022
 22:24:10 +0000
From: Miranda Miguel A <MirandaMiguelA2@JohnDeere.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Question: Derivative SDK using extensible SDK will produce an eSDK?
Thread-Topic: Question: Derivative SDK using extensible SDK will produce an
 eSDK?
Thread-Index: AdglFix+Otclbz0RSu64bSwvlrK/oQ==
Date: Fri, 18 Feb 2022 22:24:10 +0000
Message-ID: 
 <SN6PR05MB5710776BE365DED017AAD8DAF5379@SN6PR05MB5710.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6074194e-e397-4012-2932-08d9f32d62dd
x-ms-traffictypediagnostic: SA1PR05MB8802:EE_
x-microsoft-antispam-prvs: 
 <SA1PR05MB880269910387C9F8C32FA823F5379@SA1PR05MB8802.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TST2tIelRZBnQ9rHyUOoD4l5IxNzh8X4+lXag9d0fyRqVPom8ag8dbPdgLU3KHtGxRpD6UzZ+9d9soD/xW3pYNh4EVCMzR9GL0c4Pg2Yw3yenWlNcAdXXIC79Z8SICNNFlecqGymLRQu0vaRFM3XJnyJpiT84/w5fmxr9U6VEmQWPWmdBLrXya/0K/SXI1z7QLUhzRnvabYNepn8q4RSc6Nz4//uTYQGUtNtAFK9r2A5NXR8P8qgVWHx2eOhML9d7AejHhN2UMG0rWCIuYLSd572bYhi0LkaG/wFLqTvemoeTSM9EcfQ+/mMnsZw8T5DKHv4FzM3cbwwtGkEhk6bFL99QUDdpL23AraBu6KRV4s6cVBAGZGaWayofI4z49oYvFMbTngiKV/wbgUOBMOaTgILxS6NoxBgDtWNujw2BBN6liXPioeUBCCQXOGmARMeyZxBwG9bEFW7pXwji6n0vOgnJunTVNdI5g/urClD34ZXxLbVCYMLg7O9APSwzqZVO2VmOzn3crByHzinpdbOFXP4QZSN02CJHbXIBkXkGB9SWFl47+yZZMhlFE7wPmvFLc6EGyLjvSHbN/xLTyE/Pa7488n/+57VGT+d1DmHzwx1PTpCPV/BdcWYj9t3ra2jzBU0kwYG3Cqd19UwqGNCV+Ezx7GcQz2+QFMmKite7nCqE9zQDMl75JxURWpolr8ljfpYpX5pBxpaV3EEGtVo05Dymd2SVlg/GMUuRLR2mZvTMclwqxz54ZkbgV3ow68V2XbBWy0qHYnDBaqZ1ULtueqiacFgQtE33ffsmj5SyO7piwarjTD9lgQvpi40+lRu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR05MB5710.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(5660300002)(316002)(33656002)(7696005)(186003)(4744005)(2906002)(8936002)(52536014)(6916009)(122000001)(66476007)(64756008)(66446008)(9686003)(38100700002)(66556008)(66946007)(76116006)(508600001)(6506007)(8676002)(86362001)(55016003)(38070700005)(83180400003)(966005)(166002)(82960400001)(85282002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Uinz3ICJHFYiquLaOYOq1J9Owk1JJ6EnzzEyVDF7HD/R507NCO5AIfMcdkQl?=
 =?us-ascii?Q?7S7/c3WiEItFFLwgF7mgRHwwJEszlKjBxyxquJ9L38HCWZ2LQk30YlQW5jTM?=
 =?us-ascii?Q?5gRRkcSo9nOr8I4Tgk+EtE5mV2EPw6YljMD8s4CbzHe34SK/oLSkSmGxiAI5?=
 =?us-ascii?Q?J2EbsoSdfF2sl9WLi678yQZ7hl4THBK0uPYMLYbDq5oEaeAWH75EALcj1BY6?=
 =?us-ascii?Q?jy1rYnuiOznJ2/3d7SUpN5qzlArJgWQHs19zoQvyYoBpoFwI3pgMpokWCkj5?=
 =?us-ascii?Q?W2y6jjv0TyWHP4e+hHP55XM7jTncwXW7EJhL8zPJ03c8te/8zA31HMRDtICt?=
 =?us-ascii?Q?2XpRI+NxR29XgVPU3Nc+PZbyrzVkfjTdst4sD5JXv1Dka6hfj6NXnE5dEOGk?=
 =?us-ascii?Q?V72qOHIyEbJsgQxlyoyKyt75GFAwKYGQkCteA67AWJo/IEVq3pKxHrRARZel?=
 =?us-ascii?Q?JOypSmkURvVOq0ERNcjyk/naNrXBhsSLMoZxGP+9qM6HIscST2AAliWdwT6N?=
 =?us-ascii?Q?5ii0nlftqJ3BIUOjup4LSowlN9xsoCxVRIs/iK78YFTqAtyYt75bRQl/XOXI?=
 =?us-ascii?Q?xI5mUUIm2bjXmHQWU7ldtgmWtUgaHyPXTWhzCTKpT5NCGT/ShoEYd2NS0PHV?=
 =?us-ascii?Q?zazt/WLgRcC7H3tkywuabI+M4kZjaEXhJ5rRaE23AQkdAs6t278F2JK8bN78?=
 =?us-ascii?Q?F2eiu36NVrlzjG9kjs5Q+TpBrq5nLrIapyMiBtCgzLXCfcZUVxR19kx1Olwb?=
 =?us-ascii?Q?qg2Yh2sG7H6IRja+QWKk4R6+tngsXYx6zgWHUIC+R/otqLk0ehB4aUEjNDzC?=
 =?us-ascii?Q?3kxsvtCq8ubFp0U7ah3qcUUhTNVl/hKOMJfkqNSVgiqw3K7Ah+1ont1ncNFG?=
 =?us-ascii?Q?2r5DJmkljBL4o3t6I2QMX8BsAd5tBtKZ6KpJY41kBHm9u782ui6bGwi8laRp?=
 =?us-ascii?Q?2lMqwYw0w5qi/L/0eqWJdV527y4ism8dIQfMgUmDnETkZZQC8A91gGXiAU4R?=
 =?us-ascii?Q?kN3AYX+S/NBwfNNeaaa2ZzrdoeDwRXF4ZI5+AEYNkEadaRP9TT7XO+UHIo/9?=
 =?us-ascii?Q?pl8b1aJaHIP1oSluiQX3C7AhYzWE+YOaMY2dj3eDfWsjC4U0a5iKFwWsWFCd?=
 =?us-ascii?Q?uP33pn94o8PEGTTVtDohNWjVACjKnDu/9stHKd6jK1ZXMLnED+wUdFvd5H26?=
 =?us-ascii?Q?Raz5Hkff84HGOSgNiiymHSokJopHmQNmomm97Vh0UqKyojR8CBoHYWKHaiY7?=
 =?us-ascii?Q?dGBhwNyS5HvzOkDaqn7vh42jCp1PGPVE9ILTYXBqv36ZXYxkuLHYwWBLvUXu?=
 =?us-ascii?Q?OgCGd82G6FKSeXctZq+bhXE9szhjJTTMN3gDLnm+ALCeswrQQx23GipvwO7G?=
 =?us-ascii?Q?mGW504VylHwQKyob2ZZRfvFZExQivWPQtZ2bdTGZctaS8jDiT5xsOcIuJgpL?=
 =?us-ascii?Q?MasPss0ni/1I5Xp7bYC4sFOV5KL+i9nHyJMA7GyUkTewkxoCp8V+BMz3u+2j?=
 =?us-ascii?Q?EkVD2ktN6ktLwVPebzqhO90p0mxUEzv+1LUxoErVKdSCZxstyK4LA4JZQshO?=
 =?us-ascii?Q?Tyz0uvNFVFMKcT9pBe6gy02OE1IwxUc3nqDivcJYGmPTOfePiCiPoZId3Y3H?=
 =?us-ascii?Q?8/MSOONydavO+GJt6jVKwEj6SYLCbJGd3DxTDh+VO2HOyifAMRFlspO7ZHt+?=
 =?us-ascii?Q?bIIYa31nQ6ENqjgbnSM19tROr+BVg6cSoeyk7UIgwVb6eWwDcdormPjUIO5z?=
 =?us-ascii?Q?sMojR0OYKA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR05MB5710776BE365DED017AAD8DAF5379SN6PR05MB5710namp_"
MIME-Version: 1.0
X-OriginatorOrg: johndeere.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR05MB5710.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6074194e-e397-4012-2932-08d9f32d62dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 22:24:10.6593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b03722-b836-496a-85ec-850f0957ca6b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 NpId0HEaXVpVL+UOi9fZu9vNmgp6F5AvBto96zULyGnSuE7gc3bvGVYO12kzYynNUQ1MbE8cckPDcfSnejK2KBEKG5+J9JKEZMa5OEEoUl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB8802
X-Proofpoint-ORIG-GUID: MmZfkoI2zIdKgX_qQlz3sed9ONCWDNiy
X-Proofpoint-GUID: MmZfkoI2zIdKgX_qQlz3sed9ONCWDNiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_10,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_spam_policy_notspam
 policy=outbound_spam_policy score=0
 suspectscore=0 mlxlogscore=581 adultscore=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180137
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 22:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2484

--_000_SN6PR05MB5710776BE365DED017AAD8DAF5379SN6PR05MB5710namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi everyone,  my team is working on generating a derivative SDK just as it =
is showed in documentation(https://www.yoctoproject.org/docs/2.1/sdk-manual=
/sdk-manual.html#sdk-creating-a-derivative-sdk-with-...<https://www.yoctopr=
oject.org/docs/2.1/sdk-manual/sdk-manual.html#sdk-creating-a-derivative-sdk=
-with-additional-components>)  but it is a little bit confusing when it use=
 the SDK word to refer to eSDK instead. From build-sdk command commit https=
://git.yoctoproject.org/poky/commit/scripts/lib/devtool/build_sdk.py?id=3D2=
5d9c4e02a90b1fd8c6a203...<https://git.yoctoproject.org/poky/commit/scripts/=
lib/devtool/build_sdk.py?id=3D25d9c4e02a90b1fd8c6a2036d29fd2cf87eca098> we =
can see that build-sdk is intended to produce an extensible SDK(eSDK) inste=
ad of a SDK. so my question is, buid-sdk should produce both eSDK and SDK o=
r just eSDK?

Thanks!

--_000_SN6PR05MB5710776BE365DED017AAD8DAF5379SN6PR05MB5710namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Source Sans Pro";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.5pt;font-family:&quot;So=
urce Sans Pro&quot;,sans-serif;color:#22231F;background:white">Hi everyone,=
 &nbsp;my team is working on generating a derivative SDK just as it is show=
ed in documentation(</span><a href=3D"https://www.yoctoproject.org/docs/2.1=
/sdk-manual/sdk-manual.html#sdk-creating-a-derivative-sdk-with-additional-c=
omponents" target=3D"_blank"><span style=3D"font-size:11.5pt;font-family:&q=
uot;Source Sans Pro&quot;,sans-serif;background:white">https://www.yoctopro=
ject.org/docs/2.1/sdk-manual/sdk-manual.html#sdk-creating-a-derivative-sdk-=
with-...</span></a><span style=3D"font-size:11.5pt;font-family:&quot;Source=
 Sans Pro&quot;,sans-serif;color:#22231F;background:white">)
 &nbsp;but it is a little bit confusing when it use the SDK word to refer t=
o eSDK instead. From build-sdk command commit
</span><a href=3D"https://git.yoctoproject.org/poky/commit/scripts/lib/devt=
ool/build_sdk.py?id=3D25d9c4e02a90b1fd8c6a2036d29fd2cf87eca098" target=3D"_=
blank"><span style=3D"font-size:11.5pt;font-family:&quot;Source Sans Pro&qu=
ot;,sans-serif;background:white">https://git.yoctoproject.org/poky/commit/s=
cripts/lib/devtool/build_sdk.py?id=3D25d9c4e02a90b1fd8c6a203...</span></a><=
span style=3D"font-size:11.5pt;font-family:&quot;Source Sans Pro&quot;,sans=
-serif;color:#22231F;background:white">
 we can see that build-sdk is intended to produce an extensible SDK(eSDK) i=
nstead of a SDK. so my question is, buid-sdk should produce both eSDK and S=
DK or just eSDK?<br>
<br>
Thanks!</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR05MB5710776BE365DED017AAD8DAF5379SN6PR05MB5710namp_--

