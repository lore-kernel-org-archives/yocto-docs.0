Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.8875.1595497950446677686
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Apca/X93;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx2+nVw0Blthq4E9CoutOxNwfR0/Bn+ES2Nk/V4bsuM=;
 b=Apca/X93I13LVxaZJRXlOWPLYZ3xau+ex0PTmcDOCkLFSfJQ8BisosdiZId/HM90Y1Y/vnOfuYa/8Yzz+JNdtslUp+ppQ7GolYoepb4nPdKJHvctNEgMrlQIYtn8G2HeBLFibvovSLOwbgyE06e/HaNj07IoCrAmq5gZdq+Hgew=
Received: from AM5PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:203:91::21) by DB6PR0801MB1654.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 09:52:27 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::73) by AM5PR0502CA0011.outlook.office365.com
 (2603:10a6:203:91::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Thu, 23 Jul 2020 09:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 09:52:26 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Thu, 23 Jul 2020 09:52:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c53818256cb989d
X-CR-MTA-TID: 64aa7808
Received: from 1995c8cb219b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D1603F5B-A690-4255-8A7C-B0C25081BDA5.1;
	Thu, 23 Jul 2020 09:52:21 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1995c8cb219b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 09:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4GlQXIs8HTwQ8lXRSn8U08bn4anTHR8cabO/Tk2JpcmAUOYeg0tEdGOvXEPQHPiiMOPF4PSlRWNC3Z4nW4C6RMqRPt0YmbLadD5zBvICm/QAzE4RQgYHzqWw/+U9uleeWQixNhrEfiTT5kR8Qrr4VsK1RmOVzR4RmDcAKjeNTFqEoG7OGJr4jwwiFHaH67UlhdWDq5+8YILqlgo//tEw+vD/q9REwsCOGvg19GDVOQR/hsJ3cbecH+mBRTVK0czoTSdzZNUA1wMS9rx7u7aQC9/4ET+9Gxkw/bXVUIFDOLhyUBv1bQ6E4RVh2g4sN88NLIGGth8eNuJ5xZWlx3v6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx2+nVw0Blthq4E9CoutOxNwfR0/Bn+ES2Nk/V4bsuM=;
 b=gfw4/QE6xahFgLAZhYoPGwTMRO6jM/D8DPeQqnLVadmIIFDIlMZaDawJn+gwv4PgVrWFow3A3NKBwRa8daYl03TV/OEYKSotgKmUIl0ydq2c5i5n816q14NWdV0EEM+RZH8k7Fo1QUUJB9S5zx0cl+K/Z7Eg1fOC9U7nEbbTHear+XJBwP2LCa7/n17oBrSsAVyDIDIZ0IWxFUkx+kpSbL8l5lzXDZwiZqPflUJP2GZxHqpyWYotzy9uERCMbK3Q9gzusd/mwGz0z4emYJob3AWIdwX+7rbeOh33rcfBhDGTn1J9lrsfOFX6Corh2K/+2/rWVjnb7oy9Ta3WzdYZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx2+nVw0Blthq4E9CoutOxNwfR0/Bn+ES2Nk/V4bsuM=;
 b=Apca/X93I13LVxaZJRXlOWPLYZ3xau+ex0PTmcDOCkLFSfJQ8BisosdiZId/HM90Y1Y/vnOfuYa/8Yzz+JNdtslUp+ppQ7GolYoepb4nPdKJHvctNEgMrlQIYtn8G2HeBLFibvovSLOwbgyE06e/HaNj07IoCrAmq5gZdq+Hgew=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR08MB2855.eurprd08.prod.outlook.com (2603:10a6:6:24::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 09:52:20 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 09:52:20 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in bootimg-efi
Date: Thu, 23 Jul 2020 15:22:09 +0530
Message-Id: <20200723095209.18306-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.26 via Frontend Transport; Thu, 23 Jul 2020 09:52:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22e7fe49-057b-478b-0fad-08d82eee1b6a
X-MS-TrafficTypeDiagnostic: DB6PR08MB2855:|DB6PR0801MB1654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1654269B6F1EDD9ADD714BE3FA760@DB6PR0801MB1654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5fO6cWl+FrDfTIk98Kz5Lvw7zwrl8FKXCimvHywQ/S/13AavYIqNE1/n6wb0v0bmF/c2zSOxU/tETwQ7QuWWJEVVJXm4Y2anj+8GPWKVD+H+J8/h9UfVBMoVJP27OJTKqwYEgxFcuVwj9wY9YmeQhB2na5pkz/QFs/ut1KM3B/DRt7sNJ5ErDmZPqSB2i0vGDMk6Qc1jxfED2TJkbN4qqzNrE1PzyUm0fKzW4VTH2tEShpe9xLX6BPT+9YrpnhJwtK5D82p8jOWZGqsrLF6vHssMVQXijzR0fYJMCaVSaVvKUiVs9IP/csFIFbrHMIIlP1qDBUo0OldhOYlrudT8Iw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(66946007)(7696005)(15650500001)(6666004)(52116002)(956004)(2616005)(66556008)(66476007)(4326008)(86362001)(36756003)(186003)(6486002)(1076003)(6916009)(16526019)(8676002)(2906002)(8936002)(5660300002)(478600001)(26005)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Gm42Wf2M4Ae7dXukVhPfVtllUqUvamrVrTYN7Qp+aoZs+nb8U97KgaoOQiwwaBWzA8CEy0MUNizBm8CkDHNiRFUjCKK0jkNA65g6DS00BydyT7UM95fJNYWqkwpM0v+OXvNZKzMnTv8gOwmv+w+NF9vp9RB92TE25rDmCmakeaAR+L4FSUTiaYzoy+D2HvTY0CrzFzs0VLi1wm9ByKH8W5A193chnXCm/v6TJ1g5gVu7sXY/EEVAJlXFRHpduY+zbhrkCkQq8iQi7dg9n0GJfXPnBWTYFPQP7eB3Bmdg1ug5VekC3TtlO2C0/2lWOiXUWPM7pwh0tAdcSQD0G9ETYP8U9vLCKISx/d1owwuvRGYs5sQGwJtFPakkPuvtMh3nLo3yt/dqRGAMKQWbWfb7yWKAMv/BuZRcfbz26mWeicgo/+2+dSt3ksA47JoZNNptxM/On/RH7j8Fdh/h8ZmvEwQ4ynAO10EZGvlru19+ezRXgHF3xuruKzOEU69EK1jM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2855
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	879d5320-942c-4438-ca15-08d82eee1780
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+aDfIMWZEUIbTd1CE2hHYBIkiOIyQ0IyTxasf4FvTxfTWpRU0ncyIkj0Eqm+z4z9eIKuBlrk+iOoVLA357vnjDur5cOscF5h/WH2DxsatHlheHGgmPj43s6GYqNT/iAnbXfED0CFqtHHdTEvbub5yd+kOhSSC5ujdUwtDF4cTmCXIria89qAs6sAaDsjPi5kA0DAI8NCnREv5mfG6V61MWMcYvH/1wh1kO6TaPZzgQq90CfohmAF5O7VIOSlQoslAq78uqu/hfMNiHOuCIGqUUQLxqn6hVTM8723Lc7Vpkq7mOzo+0aOeTnj3Yyp31LSrEG6HpFas3s/ofik1CEVA1D3K4WPo/USxCYFUKWwHlTRKrimi07R5OLU6wOzCKTK5+VCz7WchZAOSFbcfJuVFA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(26005)(478600001)(4326008)(6916009)(70586007)(5660300002)(81166007)(1076003)(36756003)(70206006)(15650500001)(956004)(82740400003)(47076004)(2616005)(7696005)(336012)(6486002)(86362001)(36906005)(8936002)(2906002)(316002)(8676002)(83380400001)(82310400002)(186003)(356005)(6666004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 09:52:26.9345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e7fe49-057b-478b-0fad-08d82eee1b6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1654
Content-Type: text/plain

List of files defined using IMAGE_BOOT_FILES are installed into
the boot partition when preparing an image using the wic tool with
the bootimg-efi source plugin.

The corresponding code in bootimg-efi.py is updated to add this feature,
the documentation is updated to reflect the change.

Change-Id: I0d3ea8831440f4255e9d9bcf9f965c8b14331037
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 documentation/bsp-guide/bsp.xml            | 2 +-
 documentation/ref-manual/ref-variables.xml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 72a077e806..f5c3f31faf 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -2158,7 +2158,7 @@
                     <ulink url='&YOCTO_DOCS_REF_URL;#var-IMAGE_BOOT_FILES'><filename>IMAGE_BOOT_FILES</filename></ulink>:
                     Files installed into the device's boot partition
                     when preparing the image using the Wic tool
-                    with the <filename>bootimg-partition</filename>
+                    with the <filename>bootimg-partition</filename> or <filename>bootimg-efi</filename>
                     source plugin.
                     </para></listitem>
             </itemizedlist>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9fe744aff5..8cc7ef8fc9 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -5703,7 +5703,7 @@
                 <para role="glossdeffirst">
                     A space-separated list of files installed into the
                     boot partition when preparing an image using the Wic tool
-                    with the <filename>bootimg-partition</filename> source
+                    with the <filename>bootimg-partition</filename> or <filename>bootimg-efi</filename> source
                     plugin.
                     By default, the files are installed under the same name as
                     the source files.
-- 
2.17.1

