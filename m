Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA45CAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:45:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.65])
 by mx.groups.io with SMTP id smtpd.web10.14571.1758203152519338206
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=evRj9Bqo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=evRj9Bqo;
 spf=pass (domain: arm.com, ip: 40.107.162.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t7sdw1UhYnrGyClnnIROI1cL6wXyohFB/ElfUUQBltTGI4/NmCjLcFYhz8xTWPrmD3fRQYc49K1k/uYuIKqv1Mo7meFmPxWFlJa4j51GNSMakubDUexgL0dabDhaL8uupq/vyAY4CmfNbEt+MPQFW8PbUXzS77sr9/6Fowoy1+F8Le8hBUSjd4mijcN5Emlsu5/X3BIjqwkj+ynG1yjmA1dksT1sArktGKf/8zdeXZXTBfLeyAuKERhcHxqlc0m6IBp1nC4vb80C9xwHQGGubE9vq/c8jacuRYsTmW4x/g3H8axtStpOi1lxrUq59vFmbNThGL3a005iz+9W4CwGyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQqVn3n0fhd+f4p6QrsHPuLqr5g1xYtAqlc8Xzknj2w=;
 b=cBgC4/Qvry5cWPCRNc3vWKn/EemaM8q/vDVlm3+dKoobIVt2gIIl04PJqmKTJ8f1JazM1xNiTzXPpuhOBdGI158Kpj1syhxUpIjQJQhgPvhuBWAmGpbV7x9nOd0oBBEfNCAlJ1CT7Hs5slv1QUMje+N//zI8wMCr/YRivvSPWbp2G9/dWvYUEOVIGHPfIWJP+JLHhXeU0OBN6gTnfLSoNSDUO8+5JKQF1YjktjiSNMSjInl+1mMUk3Vk3+4UGU2QcSzMRRi+Y32Fn2lCb2NrsI+yg8hflkE0zDYKGHDMtb+FS1mLvPfHjsOlsjN8eAJoS26k4dj/Wzy7hmJjH7glAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQqVn3n0fhd+f4p6QrsHPuLqr5g1xYtAqlc8Xzknj2w=;
 b=evRj9Bqo4J7f9qxsRkrRzxgp8LABLNe5KpURYnXQlGzoJgiWbtbucGShVVo5QSISF5/PqJSZZJCXdmGeC9057gk4afN6gK++Ep3Ou0sV42x1/jWPhUfVcpnRNn8Cz390Hkyra3o2hOrxlbnmMSuFndQOtaFe/ne7GNDeYwnwqsE=
Received: from DU7P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::32)
 by DU4PR08MB11271.eurprd08.prod.outlook.com (2603:10a6:10:61c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 13:45:49 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::f7) by DU7P194CA0005.outlook.office365.com
 (2603:10a6:10:553::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 13:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 13:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfCMGTz5KoBrpJnjZRocq+rjlA+EZV3qbIClq4jxSBcpkYgK8m3lZQPnxseOJS8d2eyWXCjBxCzXEzvdil7co5hbWJny3ThMg89JATbU1wC2AzeVkLW5N3ayXSCRUhCQcXM1H7u9HAjhAOpyr9A/H0DxusNLK6JSm0PTR+CtLMyzbZlaR8/2r8N4B6KmuGYWWmtSx2H8InYI2uaIJNmL3tzdM4wVB7XO9/XksxDRDUJr8jQ5oy5v1gYZhfIqS0Kf6eiEf4KsdDjyDyWGDwMCEygjzOBPDjlUI1zSlrP8bXtA3RVEaAFxfnf+ofzcOS9d76DKCfOQvSn2g/fw4Hioxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQqVn3n0fhd+f4p6QrsHPuLqr5g1xYtAqlc8Xzknj2w=;
 b=S1foJuzw4l0exNIt+AUZZiDDLE5lciDiR0/L6AViIUYL+yfAiZAIhwn4zUtvsIlR8pg2nO3msmhON6sLJTHm/sdEAqJ7mgHvpu/BYHPQWQV1LorAQwka8AhSU015qkeg7LS5AFAdGiwbKMsbwyncNrq9NoXBJbyhrM3tacb2pkiO3+IqQlJwtuh/2IXMBPxFmP2J8AqczoQIKozK5IRWINgFJCoVsHxl6HQgMauQrpNL+HjVk8h99PYTDFJDXDwvOTOEXA1LEp47sWtZWGA7EPJQifEDRnOq2SOeammjtMxlu1WyDZb+ZXo7I5LEZ7ZeTJGPZakhgPyvdjAVx55Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQqVn3n0fhd+f4p6QrsHPuLqr5g1xYtAqlc8Xzknj2w=;
 b=evRj9Bqo4J7f9qxsRkrRzxgp8LABLNe5KpURYnXQlGzoJgiWbtbucGShVVo5QSISF5/PqJSZZJCXdmGeC9057gk4afN6gK++Ep3Ou0sV42x1/jWPhUfVcpnRNn8Cz390Hkyra3o2hOrxlbnmMSuFndQOtaFe/ne7GNDeYwnwqsE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6140.eurprd08.prod.outlook.com (2603:10a6:10:20a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 13:45:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 13:45:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Antonin Godard <antonin.godard@bootlin.com>
CC: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, Quentin Schulz
	<foss+yocto@0leil.net>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/2] drop Debian 11 from supported distros
Thread-Topic: [docs] [PATCH 0/2] drop Debian 11 from supported distros
Thread-Index: AQHcKHosnNCFwuRL1EOmnNYZYi/n0rSYtg0AgAAxSQCAAAyYgA==
Date: Thu, 18 Sep 2025 13:45:14 +0000
Message-ID: <E458F975-F269-4587-99F7-E76D1E06E32D@arm.com>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
 <9e6da26e-f697-4838-b204-7cae85c8d336@cherry.de>
 <DCVY0YDNJJQ3.1VWKDMHUP2S3F@bootlin.com>
In-Reply-To: <DCVY0YDNJJQ3.1VWKDMHUP2S3F@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6140:EE_|DB1PEPF000509E5:EE_|DU4PR08MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: 518d4b7f-893c-4667-1795-08ddf6b9abed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NnhGNnBWV1ZTbHpBeXpjYWtXOVhEdEg0ZVVHeDF1N3JRNnFrUnRIMVJIWHNm?=
 =?utf-8?B?aFNKWHNDMjRZTUFLbTVURkJaa1JOM3ZDdHdFb085SVJtaDBPR1ZORitjcnMw?=
 =?utf-8?B?Zm1PdG1Nb0NsQ041UE43RDdPc0c4bnJEdXpjVG9IbXFMU1NDYUkyZ0JocGxL?=
 =?utf-8?B?OGh3WmtkU213NzZ3aHkvaDE2K2I1cEc5OTVJeDNUK3NOTDlYNFNqZkM0Y0FT?=
 =?utf-8?B?MWtOejB2amg0WWNCVlorOWd1czFCNWsvR0FWV1VlVmMzM2JONlE2MGJxL1RR?=
 =?utf-8?B?Sk1zcWpqRDJzYjdIOGlPUE5pNXFBVlFCM0hSVDVneFFpVlFSU1BoNjN5ZHI5?=
 =?utf-8?B?Uk5Xdnh0RXp3cTNjOHZsclpwTjNZZndKUHRMMmpIbzhWelh5eUs0bFlQZXVs?=
 =?utf-8?B?eW9XaEpvQVcyazJLV254dWhubHpSVURrYzFvenYvcGZ1QUtCVEM1SmhxUlQr?=
 =?utf-8?B?RkNFTWFhTFI4MmFCUGllOFhMVm1EVnNLRjNGVWppWmhXdUtQdVdxakFYWnUv?=
 =?utf-8?B?ZGF5Y1RXYmZqNVNxM25tMHRDa1p3eFZXK2tQbkJ3TFgyV0R5SkNSbzk3L3VQ?=
 =?utf-8?B?emQ0R0hhYVk2WEdYL3lFOHU0WklZTEhBQkd1L05Nem1MSytmaVE2VC9jU0dr?=
 =?utf-8?B?YXIvZ01jYkxIc09ST2g5ZjczUk1zeU5SWE9VUVBqeHlWejJlYmw0T2p5UEFJ?=
 =?utf-8?B?SW9WNXI2V3JBZ01ZMmZnMG9kK1Iwc1p4OXo0STdEd2NaQ3Z6SWdIMGcrTlZ2?=
 =?utf-8?B?VElYSFB3Q2ZWSFJlTjRBaVZlY1pTY1B4MkZSN094dmxYUEUwNVh1Sm00YWxY?=
 =?utf-8?B?RGc3MHRieG1sYjAxSGUyNEdJWXJXS01teG1RSlVoZi9ZT0ZqczlOcWVob2RR?=
 =?utf-8?B?Tm1BbTJJdEdqNzJjQTgvSThJVGY2NGJaQlRSaHo4RHdXRE9iWkE0M0ttcDZW?=
 =?utf-8?B?NmdoUXgrNXhiMFowMnU2ZUZDTEFETnQxaVhNQUxMV0lzUXJFYVhsdFhnUDdH?=
 =?utf-8?B?cDlpOXNhNlFCeTg1MXJYUUlCL0dNTERoOGxsNHpueS9XZHVmTDVqeWVYU2NR?=
 =?utf-8?B?UGZZWmU1UTdGbEtpaElnL2JCbEZYS0xDUnYyNUVYNy9USkl1NVJvWmdUaGgr?=
 =?utf-8?B?Q3BWbUNLSnZ6ZkxGK1NaQlozdVBkbkFjcjBNaytjWCtmNDlzODlWZkZ0T0ZE?=
 =?utf-8?B?M2dKUzQ2MURvb0NZOGprR1VKK2FBSitXVUd1NU1SaEFOQUE2NUlQSHp4QWRt?=
 =?utf-8?B?dzBDYTlzbEtrNTl5MmIvTVpYbFAwZ2NRZ09ldEY3c2R0Yld2Z3dXd3lKRXY2?=
 =?utf-8?B?TjFHNjZ3L3RPeGlEcmZhaTRjaFQ1MzQvbUozQm1LTUdTVmhuQmc1andKLzNh?=
 =?utf-8?B?bkIwMmw5eUtDUE1HS0dEcnNrcFZNL2l6SnFDcFN2MlBxTGtBc3pNdDVVL2tG?=
 =?utf-8?B?RG5JVjR1cFpET2dTeWtRNWhhQkNVN0FOT0ozSCszSnFCYmhqZjRsaElGTXJ6?=
 =?utf-8?B?anE2WGxmZ0piMHVReHd1M204TUdtZjd0aGd0bTJ4UWJKaTFFWE1uYjg4OUF6?=
 =?utf-8?B?WXdsUlh2b2xzSjdrMFpsZGNiaTd3QjhISElIYWlETXc2U0ZpOG04U1FQTk1h?=
 =?utf-8?B?VEtUa1E2ZjRwUjEyaHJZVVY4Ry9MQkh1NHFXdzl5VTB3aHUyZzFSSUhhMXE4?=
 =?utf-8?B?ZEJVMTczMEQrbTVkeTkxV1NDYUdpQlVWYTZFUUlPYlErSE41cGFwT1BTSFN0?=
 =?utf-8?B?N2RETDc4SFNlN3dHNjVObmVudjFzS1QvOXpwNXhYNm4ycnE0YThxY2NvR1hw?=
 =?utf-8?B?OVE0Uy9HR3RIZHl4Z1lRK3ZjamlCL3o3emRUWjllNzJBa1E0WG9nM1hQR3ZQ?=
 =?utf-8?B?Zmlnek8yd1g3ZDd3dEpkMGFPbWltUlhWVFljMksrWmptY2lDM042Ykp2Tk9r?=
 =?utf-8?B?bng1MjlIU1VVS1BjZy9uN2x1eEJmWk02Qjh2Sk9OOG9MT0w2dHkwQlljN3Fx?=
 =?utf-8?B?ZE9vQ2FCcm53PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE81028DDC3C7649962D5CD1D70464C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6140
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1bf1eb1-4530-4ba7-edfd-08ddf6b99884
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVZwODJOWHRsWHQvbFNTMGFxQWg5QktEMktxVytyRzY5QVZLc21xUERBOHpO?=
 =?utf-8?B?OTlacHM5WjRzRDdoY0Zqa1BhUnVGNm4zSlBIT3J0ZHFmN0duM1FSUDg2K1Z1?=
 =?utf-8?B?WTdNQVBqMmpRNTRVNGs3bEFHcFJYdlFseGdVeEFiY3dwaVI3TEV2cEY4dlI4?=
 =?utf-8?B?cm92UG5RZDR2QlYwK1ROUUh2ZTRPVVFWSnhBckkweld2SmoraitGVTlaaStZ?=
 =?utf-8?B?dzdMbU1haEQxKzJYcThSdTJKZEc0dU52WFhDNEJEanlKeVNCVi81Wmo4ckRm?=
 =?utf-8?B?d2ZVWkJ4NDEwME14bVlHUDcxOENPWFIwY3J0bEtsSjBUbmcyQ2h1emRwQ25R?=
 =?utf-8?B?MXBvNGcrQUVIRXc1RmRmWThvVjZTMmJpcFM0OVRyUWVuMk42dkZLY25wU1FD?=
 =?utf-8?B?ZkV2a1JQOFpCckdpTVVpRytwenVobU5tcHowSDBYRCtmUWoyd1ExV3FUZHll?=
 =?utf-8?B?NTFjSmROVkwxRng1NTN5REZCcHlWSXZKcVNKbEpOWHFFU1hJY0d0VzZBRGNV?=
 =?utf-8?B?S2NiYkM2WEY4ZUIvNU1DQzBtcVIwb2tlckM2aDE3bjFYVTl1TFJ2VmdxWmdV?=
 =?utf-8?B?QUE3Y0xhdUVveWtvODFoOU8rREFNamVUZmlXcU9zWGxVeHh1dnRQb2pBVStq?=
 =?utf-8?B?VEMvZDNxVi9yZHNRdE9HaktuUlpKOUpxK25VemFXK0NPY28vWmI0SWVRb0Jp?=
 =?utf-8?B?bWZxN0ZraCtpZHg5TUxoeTRVZytDY2FXcEhPY1FUUHpGL2hvci82cUFVOHBQ?=
 =?utf-8?B?a3p5bnVXSUc2N21oMjhRQmF0cnY0NVBKTk9sWGhzR2VyL3JpdXY5T2NFVkUv?=
 =?utf-8?B?Z3Mrcmc3elVlZHR4NDc4L3ZjZnI0akE0cG9PQVNmK245YkJQS3N6RFhZZDJX?=
 =?utf-8?B?S1Jmd3IxaVNGUTRQekFsQnRpSkFzOVlBejhNdTJ1S05uTVJ4QWJMOFpqZjJC?=
 =?utf-8?B?bUJVcEF5anUycEhodFFyWEY5eGtFdk5rNzcwUEFsaGlnaGJhVHYxWGZGUVRo?=
 =?utf-8?B?SktiaXVoWTZUQTJuUDRTekJXazlYbzZuZW5TTFlYdDZPN3ZaSGdtQlA0YXZn?=
 =?utf-8?B?cExlMXI1NHBTWnNNa2Zla3BteVYzc3RuSUplQkh0T21VVXJ6dnhFRzNEMmNr?=
 =?utf-8?B?SFZnRGlod3R3UG4wYXpFTkk3bEtvcnlCOEhrQk5Ld2dsMDZ4ZXNJYTZvWkxr?=
 =?utf-8?B?M2xPMnB4SFpQTVFxSy9YNDFZSnFMTis0TDcwMXZsZndUOHQvWkM1OCsvbFdJ?=
 =?utf-8?B?T1pvNytoWEJPNDVtYmNYU2NhSUtYWXRvR3JwdHlVaGpyYmpYSVJ1SERobnZj?=
 =?utf-8?B?RjRMYkNrQWIzc0phcUdUSGh3MjBjYnZjeUlGZ2JpRDhDMk9xMjVnejlRRnlp?=
 =?utf-8?B?azJwTDdpN2diSjlKenI1T2E1eDlyZE1ZeG5nWXZUR0o0SUdFeHlzb2VOQ1Vy?=
 =?utf-8?B?L3lFck8rTlR4U2p0RUtoOGxXanpla2grWGdsd0NwV3VGcEdPQWowREJSK0Fk?=
 =?utf-8?B?aGhLbFpkN2JOMTNFRlFoUzFnamF6Q1k1eDVrSTNNS3l5OGZ0MjkyMEpNWVAr?=
 =?utf-8?B?ZzZ3V095b3JjeDN0dldzSHI2TXArejNTRUE2SHJPQ0tFaVhoakluOHdQZit6?=
 =?utf-8?B?bGpKcm1id0xlRExpRzlNWks1N1FaenVycE9SNXpUK0F2bGc0bUhJeWFnUk9P?=
 =?utf-8?B?OXBIUFBvenU5T1lsOTUvanZxemo4R2Y0ZXcrb3VGQ0E2RElNeEdqbUcrWXdH?=
 =?utf-8?B?MDNlRk9PQzByRnZidnFuU0NmU3E1eXBmSmFnTDNqWkNMMlZNdGovdlFzbzZQ?=
 =?utf-8?B?U216VE1zaG9VLzNHMENYZzZKSkVGZ0k4bExTYVZ1NldHZjFLTW1QZHJadHVR?=
 =?utf-8?B?ckI2ZWx6dDlBYWZ5OVRGSW1mY1lQZUxCanVlUzJuazlqeGdOUFJMUjdiNkQ0?=
 =?utf-8?B?Uy9pd2xpNEZ2dkYwTzFHeFM1cVIwTzRHR2E3Q2U3RUNtekVxNFFKNE4ySmdP?=
 =?utf-8?B?QnRPM3dOS0t4Tk05MHNNR1A2WGlxSlJITEFDVThqMmlwOFY4NGhXaUNmQ040?=
 =?utf-8?Q?9zRF6A?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:45:46.9285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 518d4b7f-893c-4667-1795-08ddf6b9abed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11271
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7553

T24gMTggU2VwIDIwMjUsIGF0IDE0OjAwLCBBbnRvbmluIEdvZGFyZCA8YW50b25pbi5nb2RhcmRA
Ym9vdGxpbi5jb20+IHdyb3RlOg0KPg0KPiBPbiBUaHUgU2VwIDE4LCAyMDI1IGF0IDEyOjAzIFBN
IENFU1QsIFF1ZW50aW4gU2NodWx6IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0K
Pj4gUmVhZGluZyBhIGJpdCBtb3JlIHRoZSBkb2NzLCBJJ20gd29uZGVyaW5nIGlmIHdlIHNob3Vs
ZG4ndCBhZGQgRGViaWFuIDExDQo+PiB0byB0aGUgbGlzdCBvZiAiZGlzdHJvcyB3ZSBzdXBwb3J0
ZWQgYnV0IHdlIGRvbid0IGFueW1vcmUiIGZvciBvbGRlcg0KPj4gcmVsZWFzZXMgaW4gdGhlIGRv
Y3MsIGUuZy4ga2lya3N0b25lLCBzY2FydGhnYXAgYW5kIHdhbG5hc2NhciBpZiB3ZQ0KPj4gcmVh
bGx5IGFyZSBkcm9wcGluZyBEZWJpYW4gMTEgZnJvbSB0aGUgYnVpbGRlcnM/DQo+DQo+IFllcywg
YmFzaWNhbGx5IGlmIHRoZSBBdXRvYnVpbGRlciB3b3JrZXJzIGZvciBkZWJpYW4tMTEgYXJlIHR1
cm5lZCBvZmYNCj4gY29tcGxldGVseSAobm90IGV2ZW4gcnVuIGZvciBzdGFibGUgYnJhbmNoKSwg
d2UgY2FuIG1vdmUgaXQgYmVsb3cgdGhlDQo+DQo+ICBGaW5hbGx5LCBoZXJlIGFyZSB0aGUgZGlz
dHJpYnV0aW9uIHZlcnNpb25zIHdoaWNoIHdlcmUgcHJldmlvdXNseQ0KPiAgdGVzdGVkIG9uIGZv
cm1lciByZXZpc2lvbnMgb2YgIiZESVNUUk9fTkFNRTsiLCBidXQgbm8gbG9uZ2VyIGFyZToNCj4N
Cj4gc2VudGVuY2UgaW4gc3lzdGVtLXJlcXVpcmVtZW50cy5yc3QuDQo+DQo+IEhvd2V2ZXIgaWYg
d2Ugc3RpbGwgcnVuIHdvcmtlcnMgZm9yIHN0YWJsZSBicmFuY2hlcywgd2UgY2FuIG1vdmUgaXQg
dW5kZXIgdGhlDQo+IHNlY29uZCBzZW50ZW5jZToNCj4NCj4gIFRoZSBmb2xsb3dpbmcgZGlzdHJp
YnV0aW9uIHZlcnNpb25zIGFyZSBzdGlsbCB0ZXN0ZWQsIGV2ZW4gdGhvdWdoIHRoZQ0KPiAgb3Jn
YW5pemF0aW9ucyBwdWJsaXNoaW5nIHRoZW0gbm8gbG9uZ2VyIG1ha2UgdXBkYXRlcyBwdWJsaWNs
eSBhdmFpbGFibGU6DQo+DQo+IExldCdzIHdhaXQgdW50aWwgdGhlIHBhdGNoIGZyb20gUm9zcyBn
ZXRzIG1lcmdlZCBvbiBQb2t5IGFuZCBzZWUgd2hhdCBpcyBkb25lDQo+IHdpdGggdGhlIHdvcmtl
cnMuDQoNCkkgd2FzIG1lYW50IHRvIHNwZWFrIHRvIHlvdSBhYm91dCB0aGlzLCBhcyBSUCBoYWQg
Y29uY2VybnMgdGhhdCB0aGUgc2NyaXB0cyB0aGF0IGNvbXBhcmUgdGhlIEFCIHNldHVwIHdpdGgg
dGhlIGRvY3Mgd29u4oCZdCBsaWtlIHRoaXMuDQoNCldlIHdhbnQgdG8ga2VlcCBkZWJpYW4tMTEg
YXJvdW5kIGZvciB3YWxuYXNjYXIgYW5kIGVhcmxpZXIsIGJ1dCBub3QgYnVpbGQgb24gaXQgZm9y
IG1hc3Rlci93aGlubGF0dGVyIG9ud2FyZHMuICBJIGtub3cgd2UgY2FuIGRvIHRoaXMgZm9yIHRo
ZSBBQiwgYnV0IGlzIHRoZSBzY3JpcHQgdGhhdCBrZWVwcyB0aGUgZG9jcyBpbiBzeW5jIHdpdGgg
dGhlIEFCIGhhcHB5IHdpdGggdGhpcyB0b28/DQoNCkNoZWVycywNClJvc3MNCklNUE9SVEFOVCBO
T1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJl
IGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3Qg
dGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0
ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24s
IHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9u
IGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

