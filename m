Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BA4C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:19:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.web11.17652.1738325934776455704
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 04:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QkuiP7l0;
 spf=pass (domain: cherry.de, ip: 40.107.159.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0aGhPjxiOwq8bV7oEbM9smfbljA0+HkosjEU+OWG9c+2dEsRyeodlo1Uor96VmAaNThWkOdc3AlwiWre88l7+oemAg2v1/fDzxdYENsiN4jp0XLtz+OAKY/wNPd0nTBR0vtk37FFZLh32QLzGJR5TY/IvT3bZIZ7xScbooZrJ1+s0kaGC5dcBujhf9jmAsfIlbwN+lFtgU0JzFjAl3Hs0nIsUT3jX3iSJpikkr55JhVEYcp+cGkLNQCTUa/saNiq4SByrEXeTL8uG1+Icwoa2g+RzSjZR4wx8wpszXQEdO0rhrBtWZ0JrGrEBggkzzPQ7/L2hamGyjjxONRRAHijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZUye/25akPD9Mx10oVac+XqbMnYx9KfRa38jnIZVpg=;
 b=JcC+qKZx0IZcvxOZZuXnOk4lXiJ3/Lu0Ns7wvTOK9GI9AyIaINHjwRa8gVgwgDQystnuXJAJFcGc1Er5sYNl6jwvSAAFxIPbYmbiWV5L1+Y/FVmonkfLp1JzDQkq1HGwHRvYTA8H5Be/rINRiYNo2kE7UR7OHQLZLVIbnsGQvsuXZCWEVWnnSB8YAY2VawNIm5S8GH/gsHMDdmSFW3+z6Tq4vyfUWCe7pnV1iOzmRhmhICLZdU4bhF4rLruPkdl/GndahGL81Y1OBW22JvUkW6+uLuDRz5BTsfgQAkFIIAUbDKrYzp2K1GbdebM01B4/vYj44RZ6f0Is8hSJPssriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZUye/25akPD9Mx10oVac+XqbMnYx9KfRa38jnIZVpg=;
 b=QkuiP7l0qU7o7BPUO7KQql4bUf+TH4AYfHNS/G2iroK+FuiSbtllqW1d2VXNLG6PFivcMRr7d9mEHVO3/MYMN8R68EeQAwjsdjztLT24Y18KP4YHOU2/ksJ9cQLWt81e7k4WFSl44QK0zKTAgdTOJNRaTFk96XbmphG/P6HVVnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB10020.eurprd04.prod.outlook.com (2603:10a6:20b:682::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:18:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 12:18:50 +0000
Message-ID: <ef83770e-6502-4f74-8ae4-89954666780b@cherry.de>
Date: Fri, 31 Jan 2025 13:18:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2 2/2] migration-5.2: add virtual
 provider change
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
 <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6503f631-a284-400d-c88c-08dd41f16b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aysrVDVFT25wOWVVaG15RW1pUWQ3ODNGQVZVUjlHQXhGaUEyOTUvRXVUNy9V?=
 =?utf-8?B?aFJhVEdwOHNhK0NoLytMQ0VQaDhuMjNKdEltaXh2MGRCRllDeFgva1Bha3VW?=
 =?utf-8?B?cWFTaHREc0g5MitTQjBsd3BIbEtpQmI4dU8vLzVUeGFCNC8yeTRkRlFTakFp?=
 =?utf-8?B?Y3FQWlA4K0tjM0k3ZjNPdVJJU25vVE5LRk9xd2tQMXByRTNKWUZNYkZKeWgz?=
 =?utf-8?B?NEZTb0NtcXdmRXJhcS96d05TbkkyZHhHVmp2YllDTU5aeVM0NlNxV284T1ZQ?=
 =?utf-8?B?aU5VdlN6bzBWN0R5NTRSN2dlRGtpWjE4ek1ic25mVFRXeDdsRHdwWUpMeGUx?=
 =?utf-8?B?TXdIZ2VlRHhYWHp5Q2owUTdhUnVIRmJ3aVArR0szSDFUY2VEUlZOam9ucGpq?=
 =?utf-8?B?Skp5MVBaSlRPbk85SXR5ZCtoYVBuQjl3emMrN3V0Ymw4RDZDYi9yWXhQcVVl?=
 =?utf-8?B?T0I1Nm90Z2w5SE5WS2xTZnlsOEhOblFwTXMrbnV0YW1jZUJiWkJYNWRSZFRa?=
 =?utf-8?B?NEd5amIyMHEvVXI4U3BrM3AraFlvTkMzRWJ6dkdwcDZkeFVRdldaeXg1UHFP?=
 =?utf-8?B?S0pPcVZiUGRWeTNGaE0yS1hJeFNQVHNhY0F1Tkt0T0VEc3ZjdDNVYUw4cDZ0?=
 =?utf-8?B?dm93ajMzdCtIcGpBL09nM0ZPemttVTRrOHpORmI1anlOWWFld3hLZ2ZmTWpU?=
 =?utf-8?B?UUJxdzJPTlk0Rmg4cHhPdURhREliMWFPdUpzTzdnZVFBcG9KdDE1ZVZSUlNr?=
 =?utf-8?B?ck1rMHBNS3M4S08vcUY3LzVhT2pRV2wrQTgvREIrT3RXWjMvWUFST0xkaEVy?=
 =?utf-8?B?emgrVWFVbm51VzZDTTkrbnZLQ0E5ZmNML3d3MExDaHJWNEJHc2t6ZWRITWJU?=
 =?utf-8?B?akdhSHhPSUxPTkJoN3RTYThLN3Y1QmN6RTFScTY5bW5lYUwxRjQvYWRucnE5?=
 =?utf-8?B?cnRwVzYzU0ZiWXBraEdEOG1kWWdaby93K1pwVmJISE1rbkVZRFUzVmloUlR5?=
 =?utf-8?B?czJMTU83OEZXUGxiM2xnK0poMlcyNzBnWkJMNHdNUERwdVd3WXlOOUNubkNO?=
 =?utf-8?B?QUp5VG9JNmVIQVR0cCs4dWhuSGRmTnVxMFNFS0V6UURTNjF5RWtlbkFiQXo1?=
 =?utf-8?B?OTRha0FSNFU5ckFpbFJ3L2tRbGtGWUQyNFljVU1oQ29QZmE0bXdPc2l3bzd4?=
 =?utf-8?B?OHk1VkRlYXZrMUdWN0Zvc29aRnBWK2RqNWlhQi9Rend5bmdhNlZWN0JyNzZv?=
 =?utf-8?B?RWFGaFE5cWtESDNkVWRwWmVRWDM4ZXA3aktCejJZU0JlWThoWDFORVFhVGlK?=
 =?utf-8?B?Z3pkWkdrd2h6T3FWNktLUi9JV3lhT3pMWld4TDR6MStxNEhXYjJ4bEdtL1pQ?=
 =?utf-8?B?S2pXaHJDaHJqTHNXT0tCam0vOU11cTFmSkFZeFB1TE1reWdjSWJGTTMxcmpa?=
 =?utf-8?B?cDZwamp5TVJDeEh0TjJ0bkp6VkRaTzliOVJHdnFpSkY5NWxpajJZNzBhbUZW?=
 =?utf-8?B?NDBPbjF2NFc3MnhadWFZako1R2pVVUUxSExRajdWTVFQR3hsRXlCck5Bbk41?=
 =?utf-8?B?am54d0NDcG1GbkF6WVUzOTRaejJYem1SbktON3VWcGZ1M1pEbGJZa2JaM29W?=
 =?utf-8?B?WVhBLzV6ejBIbXJZUld3MjNETmNtUHNwZkJ2MVlLNDlUeHlNMnQ1MVhwN0FT?=
 =?utf-8?B?czRaNHpTRmQvV2xsVGgrOCs4SGw0d0gzRzdXQjJGQkRkZmZyZGV6VHRqRmNM?=
 =?utf-8?B?MFh6a1RnZENCMis1SG5jWlpFOExFOTdSUElHaG44ckttTUlPOHdJRTlYNU9Y?=
 =?utf-8?B?ZzAwMGd3c1pjUVJyalpLTlFRMU9LeXdxajlSZlBsMHNkcHM5dzAraFF0VzZY?=
 =?utf-8?Q?CPFpNX+6vD1HC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ty9jN2huUGgvVHJVc0ExcGFBeVB5czUvWXJ0dmRPRWNPNDB3RVFJSE1xM2lv?=
 =?utf-8?B?TXAxVDVaNW1DR3B4UGFOdWg3ZVliVU1nYjNyUlVacUVnMTYxZFRLbEhzQlU2?=
 =?utf-8?B?dDF1Yjk2MUJWU0lqL0w4QzJhOVpYa0l3R3I3VFU5ZnQ3azRzdjM2SE9lNURL?=
 =?utf-8?B?bHJodEd5d21xNkNweWdMV1VSelhzbFFmcXRROTlQZ3NZRVU2TWt5N2hvblRx?=
 =?utf-8?B?SUYzRW54VHZmTGg3UDZsMWh4TCtkN1VxSlJWWHdtSEJRUlgzK2hhU2NFZ3hU?=
 =?utf-8?B?Yll1NDNRdnpOUm9lTkE2aEFFY3hOMVNuWW9HcUNUZXZBWnhCelFUOHVkVll5?=
 =?utf-8?B?dUhXNnNCODBzSmEwdUpFclhKbEhjdVVtdXRyRktaRU8xaDM2UmlBYXpOL0th?=
 =?utf-8?B?eTVLanhBbnhNNGZSTWhIVEhrZUZYTnRDSW94Q3R6OWppbDhJVUxnZWUybWJL?=
 =?utf-8?B?SEdRYXUzR2RGWE1uTTk0eHg3VW5Zb2RIeHZsbFBmSHRQNTZDbVp0MjZ3ZW4z?=
 =?utf-8?B?cEN1YlI1MUVUMjNzSXZHaTdJVW1maHpmTVNuUFVmTi85d3VIaWZJRkx1TmhF?=
 =?utf-8?B?YUErOWtBaFJ5VExTWGYraUZtclZ2Ym1FdS8xZUVzUUNPNUFscUdtcWJKdUVu?=
 =?utf-8?B?UGJDd0EzRVd2NVdOS2dtRGRXZy9jQ25oYWRRNTc4V0xIRGJpaWtnRTZCQlh4?=
 =?utf-8?B?QWpEd2NoTnBQNHZGWGZpVXRqTUtTbUp3ZjlDZlFYOS9vVnoraFlzQXZRSG8v?=
 =?utf-8?B?MGMvNnhJOExtMWxmd0JOaXhzdU1mQTVDR3BvSDhpWWxBQm93UXdHOElISDNa?=
 =?utf-8?B?RE1rN2U3UzlTVWVjMEV3cHM1RUpBbFRZSG5kamd0VUN0TCtWc0JyWWJ6OFJB?=
 =?utf-8?B?eU9iT29TQ1MyRjZYVCtpUWRWTWRFUCtwTkluZU1YaWt6UW92ZDdQYm5ZSGpk?=
 =?utf-8?B?MEswTUNhWVdjd1dwaWptcHoyalhNL2VScWIyYmxzVjdpZTRTTnI3QUltNjQw?=
 =?utf-8?B?Q24vT0hwaEQrOEk4bnhGaGVUdW1sOW1ZWEMzdTJYbFJObkxyem92RmFEc1Fi?=
 =?utf-8?B?R0I1SEYzOHBubUF0ZnJDUTBpTlRiWUhnR1FnOWJ4dHhhVXZuVEo5bm8wcUhz?=
 =?utf-8?B?cGd5ZVNuOEhOVlR2b3NMWXA0bW5XMlVTQUY4S0ZUVFRBc092YkJ0cFJGREY4?=
 =?utf-8?B?bEEyWXJSeEp6bHFsc09wUUpHOWY3UVh5bXNHMlI5TFI2YUVQSWJlVkhxQ2x4?=
 =?utf-8?B?dTQyTEZrd3R0S0trMUlzbjZVNElJNzVxUnV1bGdYWVMzT2N2MDMxc2t5N1hj?=
 =?utf-8?B?U0V5dEdGKzZHZFZxZFU3RW5KZkxwbDFSQzBmNmdYNTBMTGxIQldLdnFETW9v?=
 =?utf-8?B?U2dsNjZDdGdYZERKKzdnNlV6dUkveGJ6NXFJQXAwVkp2dkJPN1VaaGVLUU51?=
 =?utf-8?B?VnMzY3VoWTdFcVJwSEVXb09HMmlMWmh6TkJFQ2ZQYjByTmNld0lnUkNLalNR?=
 =?utf-8?B?T0VsQjJKaU90TlFZZlpGeTRXZERxNUVnaVFjRG5UaFVXdElOVDZJNmRzMjE2?=
 =?utf-8?B?NTZpNjFPYXVIQ08zYUd1T2xRSkYxYXF2T3hUcUszMXFCUmNmSUliRWZ5SGpq?=
 =?utf-8?B?Wi9vSmRUZmc0REpLWWJxOTBNUWdYT1YreGpjdEtWb2J3SGRBc2pYUFMvT2cz?=
 =?utf-8?B?a0tGN3VYRURuVDNXVStXSnBsRzQxUTU5OEdrWU9ObWdJODUvL3RTN09YdUIz?=
 =?utf-8?B?SXlKc2NLRzNKR1F4MFNPVjlHWjZBc3FPTkVQcnJPdTRpeThFb3Y5cmhyNjRO?=
 =?utf-8?B?SUN0czRtVXNOZm1vbDdzQ1ZZZGlIdFl2V2JacStmRlhHejhaWTBTTTUyWXE3?=
 =?utf-8?B?VlBXVHlFSDBualFkQlBvQnliRUhYQ214dVpYOGEwVHY5bG9rWlJCcmgzMHVO?=
 =?utf-8?B?SEZRTVZlak15djUvVnJCUUg1c2dvNVBlNldBQzRkeENRcTAwVjVLMWUvM0FZ?=
 =?utf-8?B?d1VxaFNjdis2SzgwV3NSb3JFNVpCc0FBcVJTNmxRdHprc1h3ZkppY0s1NWVn?=
 =?utf-8?B?SFY5N1NKeHlTckppdUlVTFhBcFJhcmNSUzRDUWZZLzVwWHJZcTd3MUJwYW9Z?=
 =?utf-8?B?ZTNzcFJHUUVUbitydEU5d2thci9GVjJvT1FySlhOdEtLVDhQQzJVU3hpQXZz?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6503f631-a284-400d-c88c-08dd41f16b72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:18:50.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qdNQj/dNncZHGn3g4LH887zy01Ro+qwGSUxVFf5W8c+EnbEhWaqF1+UK2Shd7bWC58zE+XBUVElImWNsXeER+NfHb+NvrPrfgLUe21pzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 12:19:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6230

Hi Antonin,

On 1/31/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
> virtual/cross-cc (and c++/binutils)") in OE-Core changes the
> virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
> the migration manual.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst | 29 ++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index a60e3e9a8..b29cb2052 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -105,6 +105,35 @@ some obscure bugs.
>   Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
>   be changed to be equal to an empty string.
>   
> +Virtual toolchain provider changes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Support was added for virtual providers on a per-recipe basis for specific
> +key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
> +that support, the ``cross`` providers were simplified to remove the triplet
> +prefix (:term:`TARGET_PREFIX`, :term:`SDK_PREFIX` and :term:`HOST_PREFIX`) and
> +generalise the naming. Here are example of how references to these variables
> +should be changed to use the new ``cross`` syntax::
> +
> +   virtual/${HOST_PREFIX}binutils -> virtual/cross-binutils
> +   virtual/${TARGET_PREFIX}binutils -> virtual/cross-binutils
> +
> +   virtual/${HOST_PREFIX}gcc -> virtual/cross-cc
> +   virtual/${TARGET_PREFIX}gcc -> virtual/cross-cc
> +   virtual/${SDK_PREFIX}gcc -> virtual/nativesdk-cross-cc
> +
> +   virtual/${HOST_PREFIX}compilerlibs -> virtual/compilerlibs
> +   virtual/${TARGET_PREFIX}compilerlibs -> virtual/compilerlibs
> +   virtual/nativesdk-${SDK_PREFIX}compilerlibs -> virtual/nativesdk-compilerlibs
> +
> +   virtual/${TARGET_PREFIX}g++ -> virtual/cross-c++
> +

I am not sure this rule applies everywhere looking at the commit that 
makes the change? (see below for related comment)

> +A :term:`PREFERRED_PROVIDER` assignment should be transformed as follows::
> +
> +   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils
> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk
> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ -> PREFERRED_PROVIDER_virtual/nativesdk-cross-c++
> +

I believe all PREFERRED_PROVIDER would replace TARGET_PREFIX with cross- 
(and rename gcc to cc, g++ to c++).

SDK_PREFIX would be replace following the same pattern as TARGET_PREFIX 
except that an override with :class-nativesdk should be provided. Though 
it seems there's now a second variable for each PREFERRED_PROVIDER which 
had an SDK_PREFIX, it'll also need nativesdk- prefix added to the same 
pattern used for TARGET_PREFIX. Except for compilerlibs which only gets 
the one with the nativesdk- prefix.

c.f. from 90e0a0f7f4536e1aeb311ab2b061be71b4129e4e in poky:

-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils ?= 
"binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = 
"nativesdk-gcc-runtime"
+PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?= 
"binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = 
"gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = 
"gcc-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= 
"binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"

Now looking a bit more into the changes made in this commit, there isn't 
a simple search and replace that can be used, sometimes it's replacing a 
variable with one value, sometimes with another. Depends on the recipe 
the change is made in I guess?

Cheers,
Quentin

