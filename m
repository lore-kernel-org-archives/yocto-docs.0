Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D8BC197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 20:40:14 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.38])
 by mx.groups.io with SMTP id smtpd.web11.227.1740688806698194538
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 12:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EEl8Sdn1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EEl8Sdn1;
 spf=pass (domain: arm.com, ip: 52.101.71.38, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ioqrmEwp+mUv7rbOimMrVafdUv9OQNtVtA5AH5kwIdBQQ2V/3ysgxQYN8qK2/ThsIkA7zEwPLB47OKfXdgSh7i+YNO+e3d9xUlS8MtsP7syJ6xLA009rCgTe5uo30/y38Q+cCWzTWUg8mbtm1+YUNeX4Tf3JmprM+1Ul7/MnocYc1DsS8Wgi6aZfsmoYuQ2BjHkacjwkYeg0uoWs007ipixD8daXPSrzAV6GQ/jNJFFH4LG42cvf89/RUOqNQ8IJP4k5wFXBtu3CIB7q3eG05GrV6FYv2e1um4WbXN81e4qbuy+Q31YQ/WXSVHXeElD+0SGbFZKSUtFxVAHR35alEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE5S/Q2rOGpqlYAKQw6icZ6PyVi8Fz/z0NjMrry5fac=;
 b=kzNr6Fs7UAN1TxdJ5RBsB9s5Gii6nonI0wddaVwwlQZfZ1s43/gbQZGVcKAMTOsGcSU61xUDjZHY7Cb8XaWZxtE5ifndYvRs1OLihMqqzxsHnMsxSERv7BPzEs3ODkFOfZ82gxqf9VoSVmVeTdoi0ahqTLJ7qKlsK4aX3ApnsfdlB1DZo71Yq4XsBeE9AHqBRxWxOZep/UfGgHQga3E31oQX5UUoy00lGClnWszyDg0xWn9wcJVOyd4kkrPYhUgu6wOKSFQ/thuWsF5BiTy938Z2fVf8pfheNNJcuyX1Ov8gEZvE1V6cWkvknf/55Ina/8YNezP27iP7bCKODtmGBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE5S/Q2rOGpqlYAKQw6icZ6PyVi8Fz/z0NjMrry5fac=;
 b=EEl8Sdn1P7Q8XBV3byzgtmxcX1/qWQ33EP7CqkSht4eQyzDG4Yj4VXVLT3umZhKCmBmp0/nysj7zAYEtENtOcHUTE6Eil1zhjkM/6jaAaJpOksp2zfD8vlQVn6H6yaQ3O4EZHDkfAEuiXw717EVFCfa0nBr/HB9SKCWG85VpkSU=
Received: from DB9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:1db::21)
 by AS8PR08MB6663.eurprd08.prod.outlook.com (2603:10a6:20b:39b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 20:40:01 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::5d) by DB9PR06CA0016.outlook.office365.com
 (2603:10a6:10:1db::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 20:40:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Thu, 27 Feb 2025 20:39:59 +0000
Received: ("Tessian outbound c3a902884497:v585"); Thu, 27 Feb 2025 20:39:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5335d4b71edf9a5a
X-TessianGatewayMetadata: 2Xi1+UipjYQl1p7t5dpFLD5y7ZBW50usEOgPlDFLGkCe0woxIqjZ0mGmmF8sXWfySXwC2p5mPW7Km6zioS63dQrNxBKljflK8L24jUUjOIt8UMZoF7EiSv2+unbjtUNoTpUOkLRqyZCCXjmn5CmDj8lrQS73oSNk4SYv0yUakO4=
X-CR-MTA-TID: 64aa7808
Received: from Lf0f78e25704c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 58FC334F-8C90-4B25-B5E3-B22E3193CA18.1;
	Thu, 27 Feb 2025 20:39:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf0f78e25704c.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 27 Feb 2025 20:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtKh34m9WS124BlhcoU4j1a/oZ/Sc0YcC3JAGWq0q1yTpInUP7DB/Ar+WipkslYCQztVgkNuSiVcyyQ0I1fJDaJSSGYxA9xWKpmTPIHRz0faUnXD3gs8YN00G4JsLjPnt/XRl8KRnvlZ3RdQaqhOAV8U+yp1lTCFqXvuKEfMtzntt0LT7ya4N63Rsq5P8igblzKg4AfApbAwYjRfYrXN4zAnir2JhNYEafkI7ht7qu3AmHdi+jHY7mfXva4cPu5r5awpu4g5LQjsxVLVhH9SV1R77tmWnnsiizfoWtTQLfBnyxthARK/tkY4iVfDn8u25R4O2gNfgX9lNUaNfxl96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE5S/Q2rOGpqlYAKQw6icZ6PyVi8Fz/z0NjMrry5fac=;
 b=bFOL8V+6G1kHx/E9eP6hpJ8XxCgyYJu9c2723DLGz/6YMJEiJdzjGxEfprHtJn7VDRcNsykEQgjrN74gkk2W6M2bZ+OmxX6KQKxNkTB9KKnuj1SRG1tihs0h5hwUsjnxltn4u3cri2QGpfdXbZHVKyWmBNbgJDohWffLPbb3sX4ve1rs18OQIVoo4WMy3bzauCU4V+7DiJ/+NiVRYzSe5iUAbfoJfh/cXPQK4/xP+2UW+Hzz+U3tjvAcY3xE7DmDkNqvFz83qhlu9tMHl1CSa90xEKsVSNOP533cD0IrF2+yF4ggmf6oSrA/HIZs5/o/vK71u5ZTzGrxNNgnMmIJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE5S/Q2rOGpqlYAKQw6icZ6PyVi8Fz/z0NjMrry5fac=;
 b=EEl8Sdn1P7Q8XBV3byzgtmxcX1/qWQ33EP7CqkSht4eQyzDG4Yj4VXVLT3umZhKCmBmp0/nysj7zAYEtENtOcHUTE6Eil1zhjkM/6jaAaJpOksp2zfD8vlQVn6H6yaQ3O4EZHDkfAEuiXw717EVFCfa0nBr/HB9SKCWG85VpkSU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7809.eurprd08.prod.outlook.com (2603:10a6:10:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 20:39:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.024; Thu, 27 Feb 2025
 20:39:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "stefan-koch@siemens.com" <stefan-koch@siemens.com>
CC: "bitbake-devel@lists.openembedded.org"
	<bitbake-devel@lists.openembedded.org>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>, "simon.sudler@siemens.com"
	<simon.sudler@siemens.com>, "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Subject: Re: [bitbake-devel] [PATCH v4 1/4] fetch2/git: Add support for fast
 initial shallow fetch
Thread-Topic: [bitbake-devel] [PATCH v4 1/4] fetch2/git: Add support for fast
 initial shallow fetch
Thread-Index: AQHbhIW0GmgvEAVZwE+ji7Oro2bNubNbpk2A
Date: Thu, 27 Feb 2025 20:39:29 +0000
Message-ID: <80041E02-3798-4BAD-86C3-D27381F6179C@arm.com>
References: <20250221172602.527924-1-stefan-koch@siemens.com>
In-Reply-To: <20250221172602.527924-1-stefan-koch@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7809:EE_|DB1PEPF000509FE:EE_|AS8PR08MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: b0258c2c-4607-48c1-97c1-08dd576ee795
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MmxYbCs0ZFlJODl4UFZnZXM5ZlhrY0I3OElMQlplY0ZuT0k1SnM0K3lwVERr?=
 =?utf-8?B?akQ2bmNMYnYvMFcvUzBqdjNONjRJMlJ1cmhEUzdEYzZNYWRXMEVwVGQxOTZC?=
 =?utf-8?B?NTd1NGNiZEJpZWxCbmxUcHJwY2p6eGVYMk9NcUJ0aGt6K1l5Uml2d3BhemJY?=
 =?utf-8?B?ZTI5b0laVHdNc3AzSmdsV0IvREhsMlF4OTJPRnlZVkg5RXZRanhCN2VPbThj?=
 =?utf-8?B?VnFHd0l3RVZLV0JwRDZkYXUyWG9qTkdjcTFEajFxN1BnUVNjbjR3MG1welFr?=
 =?utf-8?B?OHMya1hwSW1RTDBBa1BPSFVSSnBvTEZTaW1yRVQyRnEvdk1LdjRCZWs1OHVp?=
 =?utf-8?B?aGVJblpCTExJS1Q1YVZQS09wQ0ZsUEpTTTE0UERucjh3UmxlWjVXTDZCUm8x?=
 =?utf-8?B?QUszR2M2c3pxQjhTTzJYM240VVB3MGpPQ2piZGx2TjhvTDgzTnZUd2M0bi9N?=
 =?utf-8?B?bCtXNHdpWDNLK05uSjBnUDRucFRJUFBxVkxHNnpreUNFYnU1RCtFMWpVKzZO?=
 =?utf-8?B?ZVRJL3BscjFzTVBuSjkwV0pTd2ZYWmtwa1JxRHROSXlzNTMwRHhnV21rNENQ?=
 =?utf-8?B?cFo0QkVtelJwU0NaNU43aDhVQXVscFlOYWFqZ1ZmdkNRNzU3cmw0V2pKcjFZ?=
 =?utf-8?B?ZDZwM0ZLcGJxendpcWd3Q0k1NU5XaHhHZlMwcWp6WVhTMTFwT0ZNOUx4MXJl?=
 =?utf-8?B?VitlOVNScE82cjNqOEFjdHFqbGlmOUgzQTFPK1E1eXcxR3R0QzZOMVNMNFBY?=
 =?utf-8?B?UXF5bTk2UUIvejhIUVNHTWgvcG1VM1c4YXBNY091WTM1aEhFZlJoYTE1bitk?=
 =?utf-8?B?d1Bzb0VDZWYyaG82Q0g1endKZDlrcVN3eUJKb3JHdUxGdVY2eGY0NDIyVW5K?=
 =?utf-8?B?ZEF2OVdiVS8xd2RTL2IzK25tMUJRTW1QUStQbFhWRUpwV2xjN2g5eVE1T1BY?=
 =?utf-8?B?cGwyRGZtbHl0T29VODZGVG51RVY0N2hPb1dLMTVDYXNRZ1lKdWNxdFN1UVlI?=
 =?utf-8?B?QjFJTklwQnZNdjk5NUw2NERITDJmZCtNbEJyV2N2UTNEdERoSTV6N1BMc1ZL?=
 =?utf-8?B?NjB3eU1vVWJ0N0MvQnBRRThhTWFHcmZGZXdPSmZCc1M1dTBkZFpGZDB5eUdl?=
 =?utf-8?B?clNmN3A5aHVLcXRrVi84dEJMZk9tUlJ1TUlRU0JaWWN3ZzRHcmFBaXlBN3FN?=
 =?utf-8?B?WjNOcUthYXRoekNaZ2UxZUsvclUrWkVpcWFzV2x2aldhWlUydlU5SjZrV0Fm?=
 =?utf-8?B?WjRIdDF4Z2NtLytvbGF4aXRhajBKZWFEbDFJNXJIOTU3cTY0NWF3T2s2WUVW?=
 =?utf-8?B?dm9wVEZNd29rYlFxWGFPQXN3M2MzVzNFdTRpTUVlN0NrS2txczJFNXNJa013?=
 =?utf-8?B?eGdqWW8wd3Zad3pFYldrQStkcDA5bmplUlp2bm5NWGsyTmN5OUlabUtjeDRu?=
 =?utf-8?B?b0cxTDVlRmVVeWxadDBFNi84VERadk5NRjg0ZGZOQzM1djZzcEovd1E1SWZs?=
 =?utf-8?B?aG1RY2dXS2dpRmxldUxuNHp4SmJKaG9TelhSNVV6RkJtOCtLdjFSK2xEa2NS?=
 =?utf-8?B?OHkyTTBGRTg5ek9CSFpiaGxmOURKa0ZhZkZmN1Z1QVRIVG85clUzcjlORnds?=
 =?utf-8?B?SDBTTUpBLzBXci9JdkVadWI5WnJDZkdmT2pYMG9POTZlU1JsVFdLNFR1Mlh3?=
 =?utf-8?B?YndMVjBzQUxYMTdQRTFpeXdZYm9waFpIZnlsU2R1Q0RodDZtbkxlU2NZN3F2?=
 =?utf-8?B?SUFwaGhqME5kcVBtcUs0bFNnOUVWd2t3YjVFdlhQamd3NHI0eUZzb0ZnRitV?=
 =?utf-8?B?LzNFbEpPaUFVMndkTURaUXhnWEtqc0NSbGlDL2EwY3NkdzBNMFFxZTU5VXI1?=
 =?utf-8?B?VXNCbXZHanVKVDYybWx0Y1VPVk1uOWRZMjdJcTVGNkRSa29BNDNFb0lqbE9E?=
 =?utf-8?Q?9URO8Q09OxP/QqmuOpwMQW1Cu0619t37?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C8805464C5B7B46B0684CD086AC017A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7809
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a907ef3-9a89-4095-a7c3-08dd576ed5ba
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|14060799003|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVpuY0lZZlVOYUZWUDJld3dCTysreU54eUpFamFlazRPcnJFd3FDckhPZWln?=
 =?utf-8?B?THlkQkk3T3VkNmJEQzhJZnhjSllrRDhqcWR0d2dHWW5nM3BKdzl0WXVHbmFG?=
 =?utf-8?B?b2dzZDV2dkl3Z1B0MXUvdzlrMEdlMHNZQmk1aHVRa0JlRU9IZytYbkZWbVo1?=
 =?utf-8?B?Z0dGZVlEa0ZnaGZwcDFmNkdKdWE3aWxEc1oxKzNTdmpKZUxIVDFTYndvZk9v?=
 =?utf-8?B?dVRxUndVSUd2QWp1U2U5TW00Zm9BYndqVTJndFVYaGF0TmU1czBZaE0yV1Bx?=
 =?utf-8?B?Q0l5WlFaREMzL2h3dVorVUZONlhWYzlZQ2loQlhXL1NGQ0xybG9XTU55YzVs?=
 =?utf-8?B?NE1GTWZTaDhNM2RDa0NZbGlTUzNxMExqRXBtd2RJZi9YRTAyblRyZzduTXVE?=
 =?utf-8?B?ZnJRUGRHdnh1WWZERmlUWHoyL3lDeCsxTTYzMUxUQ25pQnQ3YXNBeVNLcVIr?=
 =?utf-8?B?cG1HWlRoc2Z4WjZaTVhuT1VId1pBUXA3OFpML3FyaHBPb1VzbW4zbUE2eGF5?=
 =?utf-8?B?RjJRdUVFWHlGM0NpUHBrZVlORlhIK28yblhuSUlaaGVrUW94bXJyR3gzalBs?=
 =?utf-8?B?a3FzN0NTdDZUS2EyWk9qZHFKWHk0WmxFdGkrQmZzZGJ2ZDVNbHBOQWloZHA1?=
 =?utf-8?B?U29UcHZJMUtiZDVvQXpiYWdGZzBBczU5MTA4R1BzUVRCOFh3ZEdoUmlCYUpX?=
 =?utf-8?B?K3lndDZoekU3RXRlbXo5ZnNXaVZBbzQ3aE5zV1l5YXVYOUExb3g2cmJwYisv?=
 =?utf-8?B?cXFDMERkM2ZOSFBFc0p1eDFKaTNiMUUyWkpRYUZySnhOSmoxZ1d6NGh5aDRC?=
 =?utf-8?B?NzhJMUdLSTNodERwdUFFejllZ0kwdmVGZ3AvbExwdW5TYVhzT3d5MDhOeUtz?=
 =?utf-8?B?U1NuK0lCbWRLemJLQTFZeGpOMjFmaEZCL0tpZzF1WXRjOVQzaWswcEthUW45?=
 =?utf-8?B?MHJ5VjVxNGNxSjJUallzWG9WM0pheWhIY1pzL0pYNUFBVDQvM2drTzN0NnRa?=
 =?utf-8?B?RHRFMmxUeElJbmRERE0xMCszNEcyZjBSTDVYNjdjNi9QZDVxc1lPY0FuVitk?=
 =?utf-8?B?bjZGLzN2WTU4VW9TTVRQU05GdDMrWVJwaFFRaExFS0xvc3Q0RW9aYnNWUkxL?=
 =?utf-8?B?SnIrNTVhSEliZGVBM2gzQks0dGQvYTFqNzZwRnB4dTUxL3dtcnhhQ2NhNUVk?=
 =?utf-8?B?UmFSZFhJYTBkcmE5dFVIZEdWQVhaTHRqY2lxblg1U1RvMFJxMjV0ak9jTWdw?=
 =?utf-8?B?MGozUCs2eE1NYU95elRYaXpnRmNmczlGdlRCY0ZqVjZ2Rys3b2hsNVNaZFNH?=
 =?utf-8?B?em1xcHRoYzJSbDdFbWUvOWhBcUlrQ25LeHlIa2d4bUZINVdNOGlJdlQ0SFJp?=
 =?utf-8?B?YXVyY3ppMkxCNFJONk4yWmtEUmt0U2dBUDNEaktOT2JBOVJHQjdzcVBmTlZu?=
 =?utf-8?B?WGhiTjJYbWlnVE03eG40NTZJQ0RYSEhRVzRidzFueG1oVEpaUmJSWER5bFZr?=
 =?utf-8?B?QndMWjMwUjQ2T0NNdlVKYm9lYnBCYUVKbGcrTnQ1OEgzSVJZRGlRNTQ2V0VU?=
 =?utf-8?B?K1BGUWJkZUY2QXlWb2UxK3hqdXQ3ZCtqRzJLRVloRmFjZzdMaEVUNHRNR1Zl?=
 =?utf-8?B?Vk1mOUI2a1JKRkhuV3BadFlTaEdFTGtidXZZRGNSV0RSZzdHenczZ2FkU0I3?=
 =?utf-8?B?eDFiUVhIU2dtbnJpc0JCWDVlUlVlcDBoUVQzdlRpMXdyLzdBTExUWEJ2UVQr?=
 =?utf-8?B?azZxeTAyeUtqLzBIbCtPMS9DWGZCVG9qNzNuZ1F2NGptcDU2dnN4Qmo3L0Ex?=
 =?utf-8?B?aXBnSCtRc2hwbTQ2OEhBaHVTRXJzNGZjdlZ1QXQ2cUs0eVJYYWQ3Y0V4bW0x?=
 =?utf-8?B?UlplNk1DSytGZUVUdVRxMWNsUzNXWUVEVDhGWXF1N0x0L0R6V1BqMjYrbk1S?=
 =?utf-8?B?QUVUbXFRNzc4UitBSE1sNWlTZGFEUDF5dEt0WmlHamxIdzhBVnBraEwyRG9v?=
 =?utf-8?Q?GEqmrvC2fsPCLQweazh2d5PxvQ7tDw=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 20:39:59.8744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0258c2c-4607-48c1-97c1-08dd576ee795
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6663
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 20:40:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6468

T24gMjEgRmViIDIwMjUsIGF0IDE3OjI1LCBLb2NoLCBTdGVmYW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHN0ZWZhbi1rb2NoPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArICAgICAgICB1ZC5zaGFsbG93X3NraXBfZmFzdCA9IGQuZ2V0VmFyKCJCQl9H
SVRfU0hBTExPV19TS0lQX0ZBU1QiKSA9PSAiMSINCg0KV2h5IHdvdWxkIHdlIG5lZWQgYSB3YXkg
X2Zyb20gYSByZWNpcGVfIHRvIHNheSDigJxldmVuIHRob3VnaCBJIGFza2VkIGZvciBhIHNoYWxs
b3cgY2xvbmUsIGRvbuKAmXQgYWN0dWFsbHkgZG8gYSBzaGFsbG93IGNsb25l4oCdPyAgSWYgYSBy
ZWNpcGUgZG9lc27igJl0IHdhbnQgdG8gZG8gYSBzaGFsbG93IGNsb25lLCBpdCBjYW4gbm90IHNl
dCBCQl9HSVRfU0hBTExPVz0xLg0KDQo+ICsgICAgQGNvbnRleHRtYW5hZ2VyDQo+ICsgICAgZGVm
IGNyZWF0ZV9hdG9taWMoc2VsZiwgZmlsZW5hbWUpOg0KPiArICAgICAgICAiIiJDcmVhdGUgYXMg
YSB0ZW1wIGZpbGUgYW5kIG1vdmUgYXRvbWljYWxseSBpbnRvIHBvc2l0aW9uIHRvIGF2b2lkIHJh
Y2VzIiIiDQo+ICsgICAgICAgIGZkLCB0ZmlsZSA9IHRlbXBmaWxlLm1rc3RlbXAoZGlyPW9zLnBh
dGguZGlybmFtZShmaWxlbmFtZSkpDQo+ICsgICAgICAgIHRyeToNCj4gKyAgICAgICAgICAgIHlp
ZWxkIHRmaWxlDQo+ICsgICAgICAgICAgICB1bWFzayA9IG9zLnVtYXNrKDBvNjY2KQ0KPiArICAg
ICAgICAgICAgb3MudW1hc2sodW1hc2spDQo+ICsgICAgICAgICAgICBvcy5jaG1vZCh0ZmlsZSwg
KDBvNjY2ICYgfnVtYXNrKSkNCj4gKyAgICAgICAgICAgIG9zLnJlbmFtZSh0ZmlsZSwgZmlsZW5h
bWUpDQo+ICsgICAgICAgIGZpbmFsbHk6DQo+ICsgICAgICAgICAgICBvcy5jbG9zZShmZCkNCg0K
SSByZWFsaXNlIHlvdeKAmXJlIGp1c3QgbW92aW5nIGNvZGUsIGJ1dCBhdG9taWNhbGx5IGNyZWF0
aW5nIGFuIGVtcHR5IGZpbGUgc2VlbXMgcHJldHR5IHBvaW50bGVzcy4NCg0KPiArICAgICAgICAg
ICAgIyBXaGVuIHNraXBwaW5nIGZhc3QgaW5pdGlhbCBzaGFsbG93IG9yIHRoZSBmYXN0IGluaXRh
bCBzaGFsbG93IGNsb25lIGZhaWxlZDoNCj4gKyAgICAgICAgICAgICMgVHJ5IGFnYWluIHdpdGgg
YW4gaW5pdGlhbCByZWd1bGFyIGNsb25lDQo+ICsgICAgICAgICAgICBpZiBub3Qgc2hhbGxvd19m
YXN0X3N0YXRlOg0KPiArICAgICAgICAgICAgICAgIHVkLnNoYWxsb3dfc2tpcF9mYXN0ID0gVHJ1
ZQ0KPiArICAgICAgICAgICAgICAgIHJ1bmZldGNoY21kKGNsb25lX2NtZCwgZCwgbG9nPXByb2dy
ZXNzaGFuZGxlcikNCg0KQXQgdGhpcyBwb2ludCB3aHkgY2Fu4oCZdCB5b3UganVzdCBzZXQgdWQu
c2hhbGxvdz1GYWxzZSBpbnN0ZWFkIG9mIG5lZWRpbmcgYSBzZXBhcmF0ZSBza2lwIHZhcmlhYmxl
Pw0KDQpSb3Nz

