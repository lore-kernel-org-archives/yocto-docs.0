Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F3C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 17:24:26 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.48])
 by mx.groups.io with SMTP id smtpd.web11.24311.1706203462157646253
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 09:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=XPKITUe0;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.48, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxzaEDEht9hd8HT4fB5O3Tt1NF9SxAD7UFNp92Y3UmZ0PGrijPYFQYzrm51fTaoT6QS73fk6B9ye+WllKAluQEs8+RHLf8e0/CPhVEwTDeI/6refkUTB2jNa118sp8jtEgcJijt8IiXAO3g1yZGSqeKGqqqzoKRsCRPWo2AaGIgh00Gwp1XDxgnlY+GYoqBPuSP+MO6GbExfcO+o/xlGMRXXXUwEDsajpWQpLyMvi09gb3VNbwliUhVDN0tsvkPehJ1V1NiPAq/xqNqjg3Eyo4w7U3LAILrhnLa9ruKS1ocn2oq6adiQ+PpaGY1w9GCtw6BdHbiuFb6pdAb6gudacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbJS93vR18SnvTf/ZX7wUDYTil1VykQ6xUoEgm3jRls=;
 b=MIIRo0Xs2kiB9GA0TiNmmcpj80XCdEgz92wqzCzxFpV1WzX10CkKLUVOV2WD5ULX5WIdq/6PimLkdcLyW7nI6M7JCAKFtcm4iyG92M9ic89rmCSqTjk41GRC/puNzVok/ES5f9CVK+Szavopsb9bKKKNbNxcxqK19iqPXO/Uo9G/j36GmHmmPOLc1AmMPfrmqTXBjE7BWieUnVnthI3esuTcnr6LQ+Nqs/SM960s0sX+lFZXQl98UsQhy7WmBDMHz2m7ueQS6Ag4i3OyO/B7HX9+vOuCYyUSmWjo/f6/qwkDH0XOhWRBNAQz0rvFrPkc9K321y6aS0vtps3diubP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbJS93vR18SnvTf/ZX7wUDYTil1VykQ6xUoEgm3jRls=;
 b=XPKITUe0x2qEVmgbFuRb6aP26193ZGi1AF5ImO73aibypbztRWvbNGC2Mku9ZbfqTZ3kJC3aAC7mZvc8k1UoYhQabTI7pSvP9xV8mU3A+edFLxxgAJgZPPGcBGidJ5DRGtJOsIBydh9nh5bL7aEIb6GBYaFsOaHFg2y+jMcgJzu8iHbHIQ9U6HjhEKEMH1DsLb6bq9sQKNbPdDG6STkTiTqsqp4/+zlJ01FAP8O6Vc/5qHPVnvQAHhquTweSrR286eoAeCtWaafOU1tnY/0OTUnE0VE4vAywvbdUKQJPKF5s5cbHdMM7SdxP7/Qdoz/KtnRPDUSvTlr25JLV3qSosw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CY8PR12MB7169.namprd12.prod.outlook.com (2603:10b6:930:5e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.30; Thu, 25 Jan 2024 17:24:17 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95%6]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 17:24:17 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Possibility to use 'noindex' or rel="canonical" to stop Google from
 indexing old versions of documentation?
Thread-Topic: Possibility to use 'noindex' or rel="canonical" to stop Google
 from indexing old versions of documentation?
Thread-Index: AdpPsu7u9Jkwri9pR1eSUE2qWRGI6w==
Date: Thu, 25 Jan 2024 17:24:17 +0000
Message-ID: 
 <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=921f61a9-d480-48aa-b388-dd91f9832b29;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-01-25T17:20:53Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CY8PR12MB7169:EE_
x-ms-office365-filtering-correlation-id: dd08f03f-fa55-4fb1-a06f-08dc1dca7594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hZXJWj8qtRzDq1+5SeS0mvz7J5y5bdm9HeIrW3SWN3i2bcC4Ci5Y/aYU3nWQ+i1rNrQTvEXIU9s78qdFp4tKID8czMaz8ofWPuhxiJDbN1SGGkX8j8jWENEBlVcw/dFAEN5XP6ajH7s7GLQaDiWkNrj5bYFNiD7J1rhCl0fQWnx3brvtVsihL0XPOS7hSaoOAIdinmWBhTc/EL5sXiQDCRa5P4HchDqL5ZyM5mQxvo6rzXS87vlCWGwvo9wXJc6SnO1YroFVQpzG551jrtVOnc3srUJm1JENxFKPcee89uN+3daPMvg86RFbP0UBi9A9MuE6D1jz9lzYQSVxLZEBwID0cM9VJ0YFNQAc5FlO7vIuf5+MNbNqMJtqwC+y5ceeyA7VvEzWCwa+Z5+rvh21bhJRDIzW+EhfkFgZbsz6JqP54bVd0TL2ic6OzLQbkCPCVuPguF1v9NWSxCRTRoVi2DhCdWBp5Ma3UnA9/50qgfbqip9XRiHtlKNY/ErV4NxcVsUyBzvZQIrWTuLhsUXY5KzDlA89vOxIWjKIVcMsKjtWlF3yzTrAi8Rdnyw94gT/NjnP+lHH4lTfwW9Ak+tlInE9gjuUDbLuCzK46NU6QQUNoiHHuVN2u2Bjg9RDY50s
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(33656002)(122000001)(41300700001)(38100700002)(86362001)(316002)(52536014)(478600001)(8676002)(6506007)(66476007)(71200400001)(2906002)(5660300002)(26005)(66946007)(66446008)(6916009)(4744005)(64756008)(66556008)(7696005)(8936002)(76116006)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GnMAM56oTt4fzgDJ8wZV3vD7WPkYhIB77xMRBRoOiiortGXYlQVvL4KDr+ie?=
 =?us-ascii?Q?Dyax3eKX58JOkMSz5A7uRuPorPl4rET7lBI7ApTpH4JcZXi5/+QVuv6eRM2X?=
 =?us-ascii?Q?XLD7x2i3OCqLzauwIWgfFiK/peYdPY6hoMYTNSWOE2p1Dz5kRA2lU8ehKwYk?=
 =?us-ascii?Q?krNVhQKvZpvq1xsNRAetYQEdm+D4KWHuMRkcHbIAcGrcBWJR1rJz0RFecvrS?=
 =?us-ascii?Q?Y8DOI+TIuWpgqdAoxfmO9+efXIc18v9m3Q4VrHlxDTvdFT0lajEE+IsPkTAq?=
 =?us-ascii?Q?bxDNjyV/v7171U3u2B4rgnAJZwVU1JDUUreQ4DiVKSDL8uCBp07xQ4cBGYCZ?=
 =?us-ascii?Q?MEsDY4ROV2qrHo/aK+IcCJYYIXGJjZmXoL/FVAksuiTr1NJkkmhupy+tOhKb?=
 =?us-ascii?Q?o4Cl4dWxv9tHZNqTj0HvZBhEzSdgWdQtr2U/QfRPP6SdDpoLOtVR1DZXMOrI?=
 =?us-ascii?Q?EHxlHePofmhIQiLBNnulO7dMA0xo7jFDVzEmb9qaALiuputIVOKM5x9GdQSg?=
 =?us-ascii?Q?uwzO6TQ4GJmPlNazHPad6p/sPGINLf+8OnNaXvHeXcwqU9l7ZPGjIpCEz101?=
 =?us-ascii?Q?yJLLdr89y8Tqt/BJx0lDDjflTBF+jyVDIwm+nOdqAydfi3FXbg+EjpHBob+g?=
 =?us-ascii?Q?cNmfGXENmZCFKgKJBVkjY5QnU3uClyqTBHMZjfYuMZpC/DdWKoJC+o5CsIrg?=
 =?us-ascii?Q?HrLTWzutHIK0uMWJXDxhfXqpkYrzl4OUV3EYhlKnx3cdVsPjSLk5wfmO4vB2?=
 =?us-ascii?Q?f2Pd/3r3xM2D7Le0evK6zKAi0l+zP4IZGlitDZcYae/gkqthhBch2eNJAcU5?=
 =?us-ascii?Q?8CIfxqJ11DbdRkegQ9YUZQsxdspBwGsO7rbzqc5UOD5ihbc61ZxY0GEykjdb?=
 =?us-ascii?Q?0/Ve6UZXFasxgoI6b+bMRlaBbtC7jGmNR+LDSl1sHLxmvZtGP09TAVwzF2oI?=
 =?us-ascii?Q?IcnVu9KYHAiXi4D9SJM+A51iS3deb53uDNDlMslnK52nN5CV0oHQYShAXbF1?=
 =?us-ascii?Q?OVbODz3K5UvPsdPCQmrWCl4Vk+Ustna0Eomo1H5KjKRfpwDc5yfuIOgwNhTx?=
 =?us-ascii?Q?yuFP1cjSv34+iRqNBn1EP2NCB2Alh4UwG3R3MIO0Obi9yzsvZNJbX7m67IY+?=
 =?us-ascii?Q?YsX09r7CUWCO4UVFF/w4xyRiI0H9qdvxXmNO68K1D+grTDy1c857kwhclAsN?=
 =?us-ascii?Q?cR03K7/5t7Ehj5LQ2p0SS7VtsMbbXnPxkhZws81ZuSn/D146FUiITMyPRuRJ?=
 =?us-ascii?Q?VOX3bIph0n2PKfTj1rFz6YNvbAh1ypQs0nd8N+brZKi+NrrFHFEPuQ8qybij?=
 =?us-ascii?Q?Uud7Tl5w8sNtnhXDxT02jeJhzkhVoHsbyYeOYc2Z/ERbwLyOv0F9TcC3uIVD?=
 =?us-ascii?Q?8i6QHaDQbnqY4txtPgt0uZ8sZRkPAtrlOk8hUZBXqE1OLh6r9GgrdkZnqeB5?=
 =?us-ascii?Q?b58h7DX9jDZCiD3JT2xEEdG00Gy64fxg07IZAL+CKGtzjvneK/pN32ZjmmGc?=
 =?us-ascii?Q?YY2IG7cowTNFNlgZyJhDpmfPosN31mjrxR5MMwq8X9D8wp8AsStCi6MuGZUG?=
 =?us-ascii?Q?9i5hjOJhK2zC3KV2pgjgWyxxxMWTho6A6pez953F?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB5430C1F3DF524811569BF9A08B7A2DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd08f03f-fa55-4fb1-a06f-08dc1dca7594
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 17:24:17.2752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5mA6N+Ivix3EJkgmLe4M01pFPuQdqXRI9M+XWDarCPv/6Kihk62hVDxcx/sViWApKaAXjKMUXAAsbS36Lvm3jTGM2LICCgWmUnpeRp9HKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7169
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jan 2024 17:24:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4791

--_000_DM8PR12MB5430C1F3DF524811569BF9A08B7A2DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Like many, I'm getting a little bit tired of searching for a Yocto variable=
 or concept only for the first result in Google to be for an older release.

Is there any way we could add 'noindex' to old versions of docs so Google w=
ill stop crawling them? Or maybe add canconical links? Or something in <hea=
d>.

I'd be willing to help out with this effort.

Thanks,
Chris

--_000_DM8PR12MB5430C1F3DF524811569BF9A08B7A2DM8PR12MB5430namp_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Like many, I&#8217;m getting a little bit tired of s=
earching for a Yocto variable or concept only for the first result in Googl=
e to be for an older release.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any way we could add &#8216;noindex&#8217; =
to old versions of docs so Google will stop crawling them? Or maybe add can=
conical links? Or something in &lt;head&gt;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d be willing to help out with this effort.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB5430C1F3DF524811569BF9A08B7A2DM8PR12MB5430namp_--

