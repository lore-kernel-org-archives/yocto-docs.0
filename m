Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web09.31544.1618231691214278953
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 05:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6Wt4tcsu;
 spf=pass (domain: pelion.com, ip: 40.107.8.48, mailfrom: janne.kiiskila@pelion.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Lyn5eZe+y7jZxrnI2ZZXbWgPQ+93t+j3zcdZSYtceI=;
 b=6Wt4tcsuvYT+3X41K6lcPMWiGkAhsg/cAGKq355m8YkXLfRba7lhPZawVmJXAWRyBbslvxqlB0XvdkCJOFvQ/a/idBFWKfzAEc8rsD1KNUN7mFTknZUVNoBp8mQhPXngrcyMIgrthAQeKz8n2Fz0k44PYD1Q6luCX/viECWviE0=
Received: from DU2PR04CA0232.eurprd04.prod.outlook.com (2603:10a6:10:2b1::27)
 by AM6PR08MB4087.eurprd08.prod.outlook.com (2603:10a6:20b:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 12:48:08 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::a3) by DU2PR04CA0232.outlook.office365.com
 (2603:10a6:10:2b1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 12:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=pelion.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=none
 action=none header.from=pelion.com;
Received-SPF: Fail (protection.outlook.com: domain of pelion.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 12:48:08 +0000
Received: ("Tessian outbound b610e7b4d771:v90"); Mon, 12 Apr 2021 12:48:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ce988079d1cc5c3
X-CR-MTA-TID: 64aa7808
Received: from b44ded56fac2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 59D335DC-D334-444D-91E4-9729CD282D61.1;
	Mon, 12 Apr 2021 12:48:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b44ded56fac2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Apr 2021 12:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rgu7+utf1nO6qpNU3hyRmK/7zXSYXLzvIGR9hBlBRemxZoLasTRXnCwSMmsIAdhmBaHGMZ5HlWOIAw/KZ8bCJcSS65T7vZBko51dRMeCO3qCo+4lasZrUYwEcjRG8+63MTVHW1xSJWnWIV1etftmIjTQcw07QCO2TWcw7UI3tC9RkQWtCcNdCRBAzglZcbCs85/781ia4JLhdKggDmvvfi559bqRiACrywTK1naGn90X7TMpgZHpWCpzzaxiwR4/j5NNiANRDP1ZEBKYmbbZpizwmnfpIV0MXSgIeZXFFYlmt5A0sH8TJg0aOyi1g0QKeu9s0seeSm9twsEtHcIsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Lyn5eZe+y7jZxrnI2ZZXbWgPQ+93t+j3zcdZSYtceI=;
 b=Jr9nch0p+8gu+8irteLXE5T9/WHAX0HcQPywD59iNXzN4U0KxxhExdQhw3nLlsCLW5BqVC8YJTacO+/VMNJp9c2Xt6/QR0yonQJnVLWHmtvzRIN3W/JbbBB+CIZa20EDHwXt59Bqr2IN3exBlsD7sF6fug/dk6Ipoamg/18iGdpk58WZfEZMAqKjOyzYGnMjjfh1Q+ht9nnXbsyHoueMzikhiowkEkbZU3n+KSyKxSUP5DDTYgi+NERvi9PxHxYdsQLKD3LBXxQwFhCmfpwIS9iTgMhaNYgqExsvgYRzixNATBgqFVmQFqiz1+NMrx430Ao7R9uj6j1iTXT3wRJrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pelion.com; dmarc=pass action=none header.from=pelion.com;
 dkim=pass header.d=pelion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Lyn5eZe+y7jZxrnI2ZZXbWgPQ+93t+j3zcdZSYtceI=;
 b=6Wt4tcsuvYT+3X41K6lcPMWiGkAhsg/cAGKq355m8YkXLfRba7lhPZawVmJXAWRyBbslvxqlB0XvdkCJOFvQ/a/idBFWKfzAEc8rsD1KNUN7mFTknZUVNoBp8mQhPXngrcyMIgrthAQeKz8n2Fz0k44PYD1Q6luCX/viECWviE0=
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 by DB9PR08MB7023.eurprd08.prod.outlook.com (2603:10a6:10:2cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 12:48:00 +0000
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6]) by DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 12:48:00 +0000
From: "Janne Kiiskila" <janne.kiiskila@pelion.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: [PATCH]Variables - WKS_FILE tip finding one used
Thread-Topic: [PATCH]Variables - WKS_FILE tip finding one used
Thread-Index: Adcvmdi1wy1ChyKVQCSzC3S7C+sWTw==
Date: Mon, 12 Apr 2021 12:48:00 +0000
Message-ID: 
 <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 0585BDCA9A271340960F9215CD8645FA.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=pelion.com;
x-originating-ip: [91.145.126.33]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a98a90a4-8ee0-4dae-7376-08d8fdb13934
x-ms-traffictypediagnostic: DB9PR08MB7023:|AM6PR08MB4087:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4087BA6C193F26CDB2012C12F3709@AM6PR08MB4087.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KNqc+K6x1h1KjaszzJoUkITAxn+IBXnTxas+pOoWdmC8ypCz5MUmMv1zAKTVitJPN8uPkh1mgalk1HQjftn5rYVWt1JwnfcYTjvbMqIZxzQ/COIO2zKimUEUn/u8Hyl5G4UCllasxGojC0yF8JQk085C/+jNXVUqrEkG4Y0DbEM104ZkIAitZ/HDI5MftcCoqmWyurKSoqvI9ITFNYPND+MMaAql8J/1Sc5PSqzUj7Q9iJXSoSLcP48WUjPnDTlGBME6nOMl2V8aQLL1bGmaslnxyh3d9wrcw4Rats/fPopOjEABd9L3QnxWLb/R+3HQ6aMD2CdNbnPKFVoHya/HjrU9x7RpegTlhdth0lHfFsD2/H4l7bekTMpb/6kROgp8Sc6GGX8sXC9opcisS64ORKr6TZG0/7j4KYQJ+gtUBKFvRAm+FDdBOgVitaSbqX98FoRPT6hRQBPzhR2CoxOkRJHybdCVT0YD9s6F2QqvsvTFZDUjnsilRri5aBEhPlZiOU6EHPcuOW7TV8ZXBC+EtMnT8sL4/hsO1CRL6X/QJwHebrLCbk8+vQWDkz4Zn/6EpVlxBDGq26HhVG6zdaghZ7j4kdRhrlpr6zjBj8xQwzL8zWoX171yrZFeIRyPYAaNXYpSQI1Ku5PpQZQ7iMZCgQFDazE4mx2F4Ox7dkk3vag=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5558.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(186003)(316002)(26005)(9686003)(166002)(99936003)(7696005)(52536014)(71200400001)(45080400002)(8676002)(55016002)(8936002)(86362001)(2906002)(478600001)(83380400001)(5660300002)(76116006)(966005)(6916009)(33656002)(64756008)(66946007)(6506007)(66476007)(66616009)(66556008)(38100700002)(4744005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?e2qI67DXaUuCrNjktCsjkMVCgcqJPVPON8mbVfFbps9jsS4gGiPSpf2bxoPE?=
 =?us-ascii?Q?r/YL1HPpoL2SU56gRqg8Obziwuh5RaXhUsP1HrPCSMABw6HOQgzPBtnor/9N?=
 =?us-ascii?Q?9pULPRhlRCxfGjEWVShiQAtkmA+AuKoHks11cC7pNWkizfbvAqmUHovU8dQy?=
 =?us-ascii?Q?qwMtJIt23HNqUOtJdbFs0RZEhzqObXd3YbAy1HNZvfuhW858Fim1dSZ71z/o?=
 =?us-ascii?Q?RoyLGEugLt9i4T98EGN4QcttEcQrEq4ZjiYIcjLKOeUXvvbfpVhmh8AJr59h?=
 =?us-ascii?Q?kXPOAGZdxZLwuCvdlmm1FoDzNKyWBJKzHEgE5VW5OOFN4cSVIwFrI/NvQOY8?=
 =?us-ascii?Q?4Bzsh6h8wavulA34XQnhFVPiuMGyGMuN3CIDCFT9pntVCICsDwlu7lrmPdfR?=
 =?us-ascii?Q?x0JXVBN2iRESxZc3UI8D9vU3cD+MpLpErn/WCEUuVB/ydhzkrsCIYGrQYGx+?=
 =?us-ascii?Q?W1qcoCQHDs2VH36gKXfuYJUFJiaQdc3O0IOKG1PVOA9m83My2hBU5Rmk/tSL?=
 =?us-ascii?Q?7ttMEcsjSsPs/Gzad33CBENsCxQ561lku7OgaLqyd91iDBPJbLs030IQ/TUr?=
 =?us-ascii?Q?rmiAOb8YUC7S/M94uNLZB/h719jlCuJLCwtjPPpzsaXFRCBZd9Ub4wqXGU+2?=
 =?us-ascii?Q?Yg7k4f600QWUaibkysFrg0bw6BBCwp9vDfWCRplbnmybv4lJgjyE0Ihn2gjn?=
 =?us-ascii?Q?IKZqtOmgz/1222jBFm+VJRcP3WPdv/VfmAO6IuU2+D0Dk7nbKUZS++24SPBz?=
 =?us-ascii?Q?VzrdTGkgI9dYXQ5purjgc9Hc+5R3IkrI3iOdp8gSmwIq9DCHRV1GgcFo7Umk?=
 =?us-ascii?Q?S3/j5+djgigCViPx+qjmSwUnj5XUZ0Ls6EvWtes3Y1jMBL/lOJP+3/tHYxrH?=
 =?us-ascii?Q?lEYeq3pGkSdQVsdWSWQJ/QPXNj+Im1LbiILM8HhzhWd3w3/Qp21/1pWqvYZN?=
 =?us-ascii?Q?7NUAb04J8aI5m9b7Vv/P1i0mi8KLUoZcVwDjt3NGgZMPq65bYcQDSUKv/7CC?=
 =?us-ascii?Q?m/wlmPDBi7O2E7rgNBf67xo40wGPTodGC+Pha3sd7RdAvZ5JOaOAOg05XKYJ?=
 =?us-ascii?Q?GDkIwR3suHLwcXa8W6nUeDahtFlk8RMcjP46wyyYGmOijS+yMSbmPs4PcKC5?=
 =?us-ascii?Q?WzVnGAz641qMQblqQxV42SEm279TfqYWKXx58zDwgGj6bGqR4sowYlIx0DnX?=
 =?us-ascii?Q?oXs3uYznH9WnbG8vW6USjmbzgvvWP4wH5F5zykDmyAlORqMC9bc6i3QOmIUm?=
 =?us-ascii?Q?VgcvsIQg/8PAsoax/aF7l5hx92nlCELdhTXKJgTzo3OP24t0eQIU4XUXM1L9?=
 =?us-ascii?Q?HdlPbgfjxQUf88RHGwK69qnl?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7023
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=pelion.com;
Return-Path: Janne.Kiiskila@pelion.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	005392a6-d76b-4a43-bf18-08d8fdb1348c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tQLSdC1dgZ6oHd+7SHYg+8E+bgWOB/yik4ZfpP5FBKSiX5Wuz7SSki4mptv8BrwkcN/8p7HVNrdSo9v/vVeA86zSZsPWUNH9c9r/dzd70lpZW1YYtwXHcpCX6bwVhRDHmoMZSc9LK8xU1JcKuUt4ZOdQ9JiloJoUndlwNppHTu9V3Mn9X2lV5hX6yTWsmpU2v5YFBoNyTz5xyjDSHfvk9sQw4mDDRnNAn7l9HITstGH2wz9bok5XnzGUDSdMeXcKqikhstX7t7yhNre3y9VsUqZq/LQvxKfKJ4dXUlqN85Dc6+T02C4Q0gVaZK9aR8xF9TBpflLBj6ZGhLLoo6ihRH4HDDOhuRpqGrc2ZZPDzf9h+X/qBVIf2zUfc6d5M3Aq4NznICy0T+gmTUABjiv+4ptVyTCgkls8iLs69efI4S6QLb3LKOUyPKBWPZVhN29mp5fx7QaBMuOjbRy4nZc1sUZ5GOSuUkhrRGYcFWq8vS+iVlGdVKYV/8e8drfqJNMnvzX9QGPSj3pwliIB1BNH7e0D/jQPPciPmB+WgzHZKB8a+XhYradhpyHtcH6D3zRpn9f7u07lRIKNiDkzonkzVu70VlQOhcdlaFIKRM7NhZYMX7ZZ8AiFlh7TTMqMD8uxT4QGGCKeh8s6kixPV3oz+Sl4Q6jqOLBOOQ0k7rn+6yBoK2M5UsX5BLU000nFWMyr/N3uE4u6KTyFTqlBhlKPpo2ODFiK93geZYeSmJmadPQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(83380400001)(82740400003)(82310400003)(81166007)(66616009)(166002)(336012)(33656002)(478600001)(8676002)(86362001)(6506007)(316002)(55016002)(9686003)(6916009)(7696005)(5660300002)(966005)(235185007)(2906002)(52536014)(47076005)(70206006)(99936003)(45080400002)(356005)(186003)(36860700001)(70586007)(8936002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: pelion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 12:48:08.3622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a98a90a4-8ee0-4dae-7376-08d8fdb13934
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4087
X-Groupsio-MsgNum: 1041
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_"

--_004_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_"

--_000_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Adding tip on how to find the WKS_FILE being used in the build.
This information found from a StackOverflow article:

https://stackoverflow.com/questions/49912475/adding-a-partition-in-yocto-ge=
nerated-image

provided by "Nayfe".

Attaching the patch as an attachment, since it seems Microsoft Outlook does=
 something naughty with the whitespaces and thus corrupts the patch.


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adding tip on how to find the WKS_FILE being used in=
 the build.<o:p></o:p></p>
<p class=3D"MsoNormal">This information found from a StackOverflow article:=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://stackoverflow.com/questions/49912=
475/adding-a-partition-in-yocto-generated-image">https://stackoverflow.com/=
questions/49912475/adding-a-partition-in-yocto-generated-image</a><o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">provided by &quot;Nayfe&quot;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Attaching the patch as an attachment, since it seems=
 Microsoft Outlook does something naughty with the whitespaces and thus cor=
rupts the patch.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_--

--_004_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_
Content-Type: application/octet-stream;
	name="0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch"
Content-Description: 0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch
Content-Disposition: attachment;
	filename="0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch";
	size=1362; creation-date="Mon, 12 Apr 2021 12:46:22 GMT";
	modification-date="Mon, 12 Apr 2021 12:46:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OTk4ODhhM2RjNDI5ZjNjNDQ4N2I2MmI2MDY0OTk0YWQyNmFiMTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW5uZSBLaWlza2lsYSA8amFubmUua2lpc2tpbGFAcGVsaW9u
LmNvbT4KRGF0ZTogTW9uLCAxMiBBcHIgMjAyMSAxNTozODozMSArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIFZhcmlhYmxlcyAtIFdLU19GSUxFIHRpcCBmaW5kaW5nIFdLU19GSUxFIHVzZWQKCkFkZGlu
ZyB0aXAgb24gaG93IHRvIGZpbmQgdGhlIFdLU19GSUxFIGJlaW5nIHVzZWQgaW4gdGhlIGJ1aWxk
LgpUaGlzIGluZm9ybWF0aW9uIGZvdW5kIGZyb20gYSBTdGFja092ZXJmbG93IGFydGljbGU6Cgpo
dHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy80OTkxMjQ3NS9hZGRpbmctYS1wYXJ0
aXRpb24taW4teW9jdG8tZ2VuZXJhdGVkLWltYWdlCgpwcm92aWRlZCBieSAiTmF5ZmUiLgoKU2ln
bmVkLW9mZi1ieTogSmFubmUgS2lpc2tpbGEgPGphbm5lLmtpaXNraWxhQHBlbGlvbi5jb20+Ci0t
LQogZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vcmVm
LW1hbnVhbC92YXJpYWJsZXMucnN0IGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxl
cy5yc3QKaW5kZXggMTlmNWUzNGM1OC4uZjA4M2Y3N2Y5NSAxMDA2NDQKLS0tIGEvZG9jdW1lbnRh
dGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QKKysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFu
dWFsL3ZhcmlhYmxlcy5yc3QKQEAgLTg3OTQsNiArODc5NCw5IEBAIHN5c3RlbSBhbmQgZ2l2ZXMg
YW4gb3ZlcnZpZXcgb2YgdGhlaXIgZnVuY3Rpb24gYW5kIGNvbnRlbnRzLgogICAgICAgc2VjdGlv
biBpbiB0aGUgWW9jdG8gUHJvamVjdCBEZXZlbG9wbWVudCBUYXNrcyBNYW51YWwuIEZvciBkZXRh
aWxzIG9uCiAgICAgICB0aGUga2lja3N0YXJ0IGZpbGUgZm9ybWF0LCBzZWUgdGhlICI6ZG9jOmAv
cmVmLW1hbnVhbC9raWNrc3RhcnRgIiBDaGFwdGVyLgogCisgICAgICBUbyBmaW5kIG91dCB3aGlj
aCBXS1NfRklMRSB5b3VyIGJ1aWxkIGlzIHVzaW5nLCB5b3UgY2FuIHJ1bgorICAgICAgYGBiaXRi
YWtlIC1lIHxncmVwICJeV0tTX0ZJTEU9ImBgCisKICAgIDp0ZXJtOmBXS1NfRklMRV9ERVBFTkRT
YAogICAgICAgV2hlbiBwbGFjZWQgaW4gdGhlIHJlY2lwZSB0aGF0IGJ1aWxkcyB5b3VyIGltYWdl
LCB0aGlzIHZhcmlhYmxlIGxpc3RzCiAgICAgICBidWlsZC10aW1lIGRlcGVuZGVuY2llcy4gVGhl
IGBgV0tTX0ZJTEVfREVQRU5EU2BgIHZhcmlhYmxlIGlzIG9ubHkKLS0gCjIuMTcuMQoK

--_004_DBAPR08MB5558B9EA79319C4C09AC1802F3709DBAPR08MB5558eurp_--
