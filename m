Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB60C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:23:07 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.42])
 by mx.groups.io with SMTP id smtpd.web10.838.1740068581624455329
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=afQiYstK;
 spf=pass (domain: cherry.de, ip: 40.107.103.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xadXaiC8hWiE75LIP7HAF7R38pAOEy/c2r9AHIh1DR/Kv7kp+CArzMW1yyafLM8mTMS6bjxd/hhVgSWufljpUNeogF4pokf6Eg/PeQ7YPhuAXyMNE67MrVbMy/xSDo1BEEr96v52Et7DYcmU1ppr3l5jWaEmdpTUhgDftZZFvm7SiEt6LpONF1ZZM399u7DAUDbSjACDAruibU20WbPacGwb9Z+XnW/4FFShBdPEejeU294HJzdM8KG0eqOjI+1gDNmwk1xYiPtemPVxW2+sWMkreIEpdKZ6bra/J4JRBj3ephg2etKJjBcmuE+J2MH5FlGwjVuUVYcV5SQl6FooPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR76/AXSGwwMihvmWoPJ3VGz741gaVY+bqo9g77NhzQ=;
 b=e4J6tUdsxpZOmrxMRg4fZfcQVOxIBoeW6Le2LQlNU8LC91K8EnSuYbRl88kWVmro5hJjvfGiM59h0TumCeu2Da8xpbpgEB6Qx2GBXqLhq87utxOdvwknCAHyFWFQLqzOyLBKbPAvOiE7qEFfWpGg8dYx4cCjy5D5xN1rUZM33OKXV36/VwapDLyakStdM55Obg1kMfnjXfVSQuzzj6Tdua/caN4QWman7AdjYHQEwF9kIsl38giOm9PwXwpgIC/SsxvDjnzkPGdECGeIDHC5GhMt3rHd24vBLzo8nwRG0h+rhblhKHDRX/5PGaanFgQWGRm/9cNJYdzEtm7kO6VPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR76/AXSGwwMihvmWoPJ3VGz741gaVY+bqo9g77NhzQ=;
 b=afQiYstKUa3ecvxc21ssR2kfKTfZQ12GZE5raepR3szc9U1MnDyHawvzLFGHtx/i4mPZ7/fTtSiE8WDMGgWRM73gswIlnorVZNbdKlYL/Q/HWuDB9pqA1754ga+W5XhpAqDY5iCh1bqx2OFo9gHihv42ef0DsvCsUZlzWuCsKJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6969.eurprd04.prod.outlook.com (2603:10a6:10:11b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 16:22:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:22:58 +0000
Message-ID: <83887dd0-0a7f-4ad3-8311-58bc156d05bd@cherry.de>
Date: Thu, 20 Feb 2025 17:22:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/6] overview-manual: add UNPACKDIR in the
 directory description
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-5-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-5-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7db5a3-47e5-4dac-80eb-08dd51cad687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cjlBaFFhbDdUU0I4QzN1SFBteHdxT3hqdFI2TnkrUldkbnAyVGc2dWhpaEE4?=
 =?utf-8?B?OVF0VUN1ZmFHaGdLeWJwcU9XWDlTcXRrZGJjR2tCYlV6OVBSTE53ajdrU3lI?=
 =?utf-8?B?eXZEa2haMjZYMTMva1Q0c0JtcmllbTZIUU1hK1UxaXl5bTNDWk5mZDhpU2xX?=
 =?utf-8?B?WnIvWHJlek5hZmpVZTErN2RJc0xmUGhVdzlsaGh4bTFzSE5KWUo5ZzJtS2Vn?=
 =?utf-8?B?V25kaHZOdHMzYnVNbVJicytKUG9ya214cEdqanZ4Rmw2UFJmK0twakVPS2Nm?=
 =?utf-8?B?Uk5EMnRyT1Q4d0NQOENWNHFpOEhzSmFLQmVVQnpDYzA0Y2VvNG1nTC9uVXh3?=
 =?utf-8?B?LzlYQmxIVkllbGU5czV6K3dOYVVSOHNlc3MvTjdwMUJQd2gydWtXU1hqU3Ba?=
 =?utf-8?B?OUdhaWVoRnZYc2VUSTh6VEN5YkVTS28zMnVnWWJwWnhCMkJyRThPU3VjaHdS?=
 =?utf-8?B?azIxS09BUkVWWVBXMDB4cEpNVTJ2VGtvSitQdmJpQVh3dS85djNodWQ3TVpG?=
 =?utf-8?B?UUlNenZYYjUvR3BxQitmMzR2SStNeXNxcGVkZWlVQ083YkN1R0lTblNRZk5l?=
 =?utf-8?B?STlHSUVPZzFuSVlwcURiQ3h3SW5ycnZuL245cm11OFdCMUVvWm8yd1J1dE5J?=
 =?utf-8?B?TDZLeVN1WTc3dHhWVHNXL2lMU1c1SmdxL3ZnKzZIc1dyeG1YTkZ5Y2hHR3F5?=
 =?utf-8?B?VytvaU9HYm9JOHpUM3ZtekpreFpnQUFxbXJqUDJzeTVmVmtyTXVZVGhMS0tC?=
 =?utf-8?B?SDJmamtTNEhCRXhVM21LYU1aRHVXRGh4K1NTVjRjejdPN1Z1eGlBelVNZHBM?=
 =?utf-8?B?ZGZyeERsYWsvbXVqaE1JaytjekQ5aTV4N3RJT0VybjBXU0hjd29aVWx5ZTF2?=
 =?utf-8?B?SGE3SzdkQUlscFQ2RjZDWFdGeGJLMkczTFlhZkNmbVVFZWhCaW1FU0s0dGRR?=
 =?utf-8?B?ZzB5T3V5dUtFN2czWDM2ZWlZMnljOU9CcTRLTnlEcXhDaTFRMHQxdURydWhm?=
 =?utf-8?B?NzlqYUo1WW5rcDkvNW1jQTVjcGdjdGpqRW1XNlpoeVJTNCtsVGRZSHlSSGtU?=
 =?utf-8?B?bndwRjB4bkF0OFp4Y25xeklaSXZtUlIzdWdGajZXdFJDbGNyZ3RodFpHUG5u?=
 =?utf-8?B?Wkcwc2IxZ2Z0WW84NXNYTlVwVDUvSkhES0tZcjMveUxqOWlncFZ1UGV3T2pZ?=
 =?utf-8?B?SVp0cmdjY1F6TytBakJqb2ZidlpWcGhKV2tuTlVzdWo3WXRtYkdCaG1LNmhT?=
 =?utf-8?B?NjNyU0hSdmUxc0JLN1IrdHlmYi9MN2xRTzRXSVc4dkJDai9RNFNmOHBjblc1?=
 =?utf-8?B?UzI0LzZNNDZkdThQOFhSSldLN0tSY1FCZThlcU8vUnI3a2l6U3Vub3AramI0?=
 =?utf-8?B?cVJiSkk4NkZ0L2pYRExocGhiYUp3cllhbUY4bCtOdFRpWm91cjN0NFJjdnYr?=
 =?utf-8?B?STh4VEpMbGxCTEdJZmxKYkZQMFFjVHFBZHptdzExVzBGQkFaQ2R3dFI2eVg5?=
 =?utf-8?B?NnFxM0hmRFFxU2RCSm1TTkgxTjA2Ukw1cnZhSmhrVktrWGJ1andCczhiVjlN?=
 =?utf-8?B?Q1kyU3llOGdVaDJkOEpRWkN5d2RwdmczTEt2UmFXbEZ5cXNUUGhidXkxR0VB?=
 =?utf-8?B?c0dTVXZPbzFaMVNPcDhiaVg5L0dROGZvVHkzc21nYk9pYnZ6SFJYVmxOUVhj?=
 =?utf-8?B?NUx0Mmw5WGd6dWQ5M1ZDaDV2Rmw5N3oyeS9PRkpJZTRzSGlvRHZlMmh0U2x6?=
 =?utf-8?B?bUxndTdMNTlpYnducE5zUDE1YmxXUEtHNlFHdERTMUFrNHhXNS9XN0prUnQx?=
 =?utf-8?B?NnhxaldSRUwycFlDK3NadVpTY0xIUUFtUmhSRmk3Ym5XSXB4UE4wUlBaY2JX?=
 =?utf-8?Q?GNDGeqyhJkifB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0JzUG0rQUNhWWREVzRLdXlVdWJyU2x1eEFWYk1UN0hEVHE2QXBYMnBPVUVn?=
 =?utf-8?B?SHpFS2I4NmdMajQzdEoxbkd5ZS9vRTZOeFRsY1IxdUtjc3Vlc0VEb0tPVU9T?=
 =?utf-8?B?eHBXL1lrZjFBcUZZVHExQjBEUERLem1QUzJqbnEzMjN5U1p3dTc4Uk1hK2t4?=
 =?utf-8?B?SDBQWHJ6OUhBb0xIT2plTkFaQzNEVnRlWVVVN3lESCt0Ym5Wd3ZLaGhHUUFi?=
 =?utf-8?B?aDlDNDc3cEZYWWk3YTI5OGdCYmhrZ0tTbjYrT0ZlaDZaVGtFNzVwaFFqelFY?=
 =?utf-8?B?Tk40eGpEWDNQcWFLWXVGc0piRTdicmlvK3lWK2ZyUjM2bGNuUkRlNjRtQnVr?=
 =?utf-8?B?ZU5FaldDNjRnNzFSS2NxUmRNNkVpTGFYYk5FYWVzSmhJR252aHNDS2VmRDUy?=
 =?utf-8?B?aEczQzhiR2p1dWxuTWNnYWxiMXdFRGdEN2tuNERvRE9KcFRocjl3SWxKWmFM?=
 =?utf-8?B?NFdhNFhjL2dHN2ZCMkVDMFJYUm16ZnhTSjBLajlYZnFYYmJvdGtCamQxeURK?=
 =?utf-8?B?MTF0bkswczhCbU9uZFhZdzZtTGo4RWFOYnlORWQrTWRuNndvMDN0SGxEYnF1?=
 =?utf-8?B?QkdYSHU4Y253TnlnaEJxWER5c0d1bytTKzQ2aGhZRGR5dXo3VnkzbitKL3Fl?=
 =?utf-8?B?ckw5SEF0RW43dFhOQzMvK0J0SFVxVFpVb3dnSUlWak81T3ZwdE11OXpvR3lG?=
 =?utf-8?B?RktlQ0ZIVHNQU1h3bjFzVDc2a2hrTy9HZ0xSOTBFbDMwa2Y0WlpQdlFPU0gz?=
 =?utf-8?B?TTJyVDZuZlN3aG9zTnFLQ2hGVzlKbno0WWxzb0wrdllua3NONGZmSEY5TlRa?=
 =?utf-8?B?UXVEZ0dQSkdXOFlQYmZ2aFFON1Fxb2pQTkxPMlJDUjlSc2d2VGpCOTNBNXk3?=
 =?utf-8?B?STNwZ05yZ3RraEhZUEprUmxFcnVEYnYrSmtMNlBFeit1Zy96R3FBbDljck0v?=
 =?utf-8?B?NWc5dlBPSXI0eW9qUzdpMEtQeHp2a0hJTzNETmN2UE5jUTYwSnZyM2FxU1BI?=
 =?utf-8?B?bGdyRCtyM2x4RE8xTHNKMytHTktMSzNnaE9Gem5wMTdSdkpQNXhVT21PbGti?=
 =?utf-8?B?c3hNaHZ3UkI5SWVvTlFiM1NFWTc0QktvRE16SnFQZmMxbTlzeFhveTdETC95?=
 =?utf-8?B?MGcyVmNVL0ZtbXU4V1JjelEzQTN1bzFPa2RWdVB0VnhGcDR0emFIMFZtdTdw?=
 =?utf-8?B?Z281YUhGUHYxYnNDd3NKZWVHUitjUWFRUzZFaWdvV1hhdkExSDVad0cxQllZ?=
 =?utf-8?B?NFNhQTV5bE9NMW1tL3MvcThaTmt5RnJSS1lYSzBSMjh6T0pkRSt5STRMQ2Qv?=
 =?utf-8?B?OGlHYTBiY1hLQ2FlVldMWENla1hnSWhHQThhMUZMTDdJQ29QS2duNFdaa0sx?=
 =?utf-8?B?a0Nidjcxc0plUkcwczFvTmpJL1VqWEdUeE4xblRjVHZFelM2enZ3NHdiMlU0?=
 =?utf-8?B?LytRRTFmTis5cmVkaFpIb2tITm91SzY4Umlheno3WUhiZHRZVkNhWWdQblow?=
 =?utf-8?B?V2NQaVBJZlBKVjVzZXhWclJrSUsxbUlPeFNuNEorM1RrbzFkdEdUWThCQ1d6?=
 =?utf-8?B?Q0VmYksrcjhYaldub21MdFduOXdQNXRMR3FtV0Z6UW5VSkNLUzBRQVE0UWFI?=
 =?utf-8?B?djB1TXVmV0MzWmpQMDNCUUFmekc4QnpkenM4NGlVb3F3MkhkVFZjY0dCRXht?=
 =?utf-8?B?ZENzU0pPYzkzYk9tVVJrenI4djdpRFhjYnBocTVjUnVUbFlOSnBHWk4wUG9l?=
 =?utf-8?B?YkpXNEpPTVdOdmJnUFp2cmN0eHNLWVI1MjR4OXRyanlOMlZub2JEMktUQTI4?=
 =?utf-8?B?K242bHRtRmV3OFdMdlRPVzhad2tDb0Erc1poa2hmeEkvajB5TEVzVVVmS0N5?=
 =?utf-8?B?VVVidDFhTjBOajdpN0ExSEdXQUxCQ1Y0QTFrUEw5VVRoQzdaL01CeUlPSWlo?=
 =?utf-8?B?UnJlRUpvWkx2akpTT3FwVDlLeXhadTFxOEVkTzJBcmxmYWJJbFEzV1dBb0NO?=
 =?utf-8?B?U3pVSHY4bWRMY3V0Ky9vaGpva0loS3hrS3pHU1g4VmNIWVluUU16UXhEWWV3?=
 =?utf-8?B?M2pkOHNad0ZpNnN4WDZzNCt2L3hKTWRMOW8rdldRZ29BUWNTVFRMUUFBbUhZ?=
 =?utf-8?B?TGM5R1haMUFjY3puanNSY0R0NWNET3l0STJLVWkwdXl1VnZRTTJDSmlSMlV2?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7db5a3-47e5-4dac-80eb-08dd51cad687
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:22:58.2059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug9X+LxtjxGONWXxfkS64dBlhTj0R9I5Y5YHp5sUSAblELrVe//JzCoc/FvYSTSTv7aI46l7mXFmiu6yadkuQPY7rNcydXj51c5aWAQ/QnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6969
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:23:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6423

Hi Antonin,

On 2/18/25 10:12 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Mention that UNPACKDIR is used as a location to unpack the source code,
> and that S is the final location of the source code. This is
> deliberately vague, because as there are multiple instances of how these
> directories can be defined and used.
> 
> The proper explanation of how the UNPACKDIR and S directories interact
> is left to the reference manual, under the UNPACKDIR variable
> description.
> 

PR is also removed in this commit, maybe a separate one to explain 
what's happened to it would be nice? Or at the very least in the commit 
log so it doesn't look like a mistake?

Looks ok to me otherwise,

Cheers,
Quentin

