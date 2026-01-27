Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F280D2595D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 11:28:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8652.1769513300538506279
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 03:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lzdK0r0+;
 spf=pass (domain: cherry.de, ip: 52.101.65.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssD5iCk29J79L5bwjFZp0DKqex0d5kxGV9czArWfQw4m3bXOyrU+c64qC48aYmw0rdTKCl+RTdUCecG5nVAcMhytVHKq0/Zp1WRXech+7flppUV62pAp9dhg4sptj4wg+8HvdWoLFb/y4HNyLFZa2tlqrPwB/lnqSUoz7SIRG9E1Gpj86tLGGlxkhR9YF1rhB0/oejpyG18HCnQAkh0iYp/FuaZjmz82SiLi2JgcguaWGyuk/1zFBxz2hVSfYDP6eFbmlppMOyuwh0X/fDi4vpUowibHEb1aE0ZaMkB6t4bL92+9k4UwLy7T2T7XIdYDTgRbt8PwE2/UTTSgfmQwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUu4lR+DeyVdm5DI9p1GE/pQmhadPBgGLahFpl0JwMU=;
 b=Et3Qq1eEXUEm6/j/D6R6wAW82kLidpwzBOfqGrfAKMLEQvPxXLIXKrloLAOUaabO4uhWD/32OwHYjOqZYkGzu1rB1zah61KxVne9Ip/MA4iWuzu60ICQDlpRMszxGuu0Oh/MBHOFVqdalm0ogQHx1/TF4ViyhBUkgSyJlSNiEsDpuQdolsltkqRAd/KgzbV0hUl9Uq/LVZ7ROCCxa2Y4IFb97AGBHbMHDKAsrP9OHDZd7EviqkJURF71dUJYaggcTHuthZJVWWI/UBNy+HhUaxpGzvYGuQBLQTMZYzYfUeoAI2a7m11Q/a9AWBJgQbyMbj4I5tyLn57/MMeSVhAY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUu4lR+DeyVdm5DI9p1GE/pQmhadPBgGLahFpl0JwMU=;
 b=lzdK0r0+4GB6RdhVXXnfzOdsmqkoMF70xXiQP5HSZ9drm8OfCp++W5Qu+twx62ILjy2iGMekS9abWI8v4FVFC/BfR6HUjvLOOIGotdML2bDukSKJl3GTIL5D74hQDqvF5h10UPCt3cTu9Hqn/oGDyMgukUDNOhpiiMnS0Zg+XA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB9096.eurprd04.prod.outlook.com (2603:10a6:20b:447::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:28:13 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:28:13 +0000
Message-ID: <17c0f924-35d0-4d2b-b152-8ea5f7812676@cherry.de>
Date: Tue, 27 Jan 2026 12:27:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 04/56] bsp-guide/bsp.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-4-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-4-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eeeb185-82a7-4aa3-0ce5-08de5d9727de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dVpSaFN5UHIvb0dOOEFCY3RLQTNJeEtnUXZYV25OODF3VjFCVFlxQ2dQM2ZP?=
 =?utf-8?B?RDRTbnIzcUR1cWo5dmNyUmVnT0luMWI3dGFlOFdkN20zSmU5WVd2RnZKcVpJ?=
 =?utf-8?B?RUZ0L1dIeHJLL3Y4RG95cUE5TnN6ekdrOEt4VEVuVC80bDJXM1lnM3hPa2pZ?=
 =?utf-8?B?ZU5GS202dDhIOVlEd055dEgvbGUvNUpNNHFDbmY2RE9OYy9pNElQQVo4VFF3?=
 =?utf-8?B?L3oxUkdjQVJyL0xrbUJnNWc4aGxYZjdEV0JvOTNGaFE3RHFMNTVQbnpkNTlh?=
 =?utf-8?B?WHN2dWlRVmJla0gxbzZHU25UN0U5czJ5UUkvOEhWSGdXN2NnSDJ3TUNaeUJU?=
 =?utf-8?B?d05UTm1CVmFyM3VNVE11b3N3QWVmb3lPK3JaQTlpOVJoNUpwVDNhU0xEc3R3?=
 =?utf-8?B?M1hKU01qMmtOZnRQYlJrcmFFZHlVZzFEWlJTckNRK3NZRFJETnlXUWhWcnlq?=
 =?utf-8?B?cGhxbVgyRjBqcGhySXdGMlZOQWpSZVRVRllVb3I3UkVqNWswY0I3ZlpJZ0FD?=
 =?utf-8?B?R25nYWgwaHdmTUxURk5qRVZwS2diMHpIQ0xGYkJncHlsZGt6V2xGVjBKdVNt?=
 =?utf-8?B?UU1ReTVkajZQVGxhUWdicWxnZDFEeFZRb045UUkvZXF3TDVTVUw1YjdJUm02?=
 =?utf-8?B?NlZzbEQzZzZxNG9nQVFheGY5eGNzaSt1LzdhWVdoRWxNVG5KRCtGdGp3bGJn?=
 =?utf-8?B?VEl1bEl4WU9aeE9HYjNuSXZ3ejN3TVl6cmhmVmQ3VWFOc01ESlYzcWRuUVVp?=
 =?utf-8?B?dCtLYWRDZUNmUTQ0ZTBwYUo2MEx5c2dINkx5NVNOWDRoVFZkZzR4Qlp0TkJv?=
 =?utf-8?B?WkFTZDFZWkFrTVpLbGZCZ09zbWh0Z3lPRHlXMDJwMVVPQ1RBRFV1czlTUVg1?=
 =?utf-8?B?VU1BUWV4eVFMS2t3ZjIxSUVkTzdoTHliNmpDSG5LWEJJSXRuaWExc1FmMm1j?=
 =?utf-8?B?U0JVeDcxYXJvRDRQS0JBMXpOSVFvYVV4UXJKaHExSFdxWHVRS1MxYWlIUlkz?=
 =?utf-8?B?UWsrbklMdlRFakxxekRvMlpSR0lwcUZJbmF4bG85QUdSWWJZclc0YXpZMHdW?=
 =?utf-8?B?UnFUN1VGNlQ0STdmdEVheVVrWGU4cXFKajkrcUErcnE1dGVIek1Tb01ZQnpG?=
 =?utf-8?B?YXVDbmZ4R3FETk1ZWHlEN3pqY1RLdmtmTTIxdVZoQm43c2s3MmIvbVduL1Y5?=
 =?utf-8?B?YkRYTDZPclljc25OMmtKWUo3c1hjZGVuZ0dRbTJIa2xlSFNVUUxuZi9walFh?=
 =?utf-8?B?N2h4MXROMlliV2tBSVA5L3pvZVZza1NGb0pmYmJKci9iZHpzMUdGTVZtMEdH?=
 =?utf-8?B?aEwxc0ExdmxBWm0vQlp6U0o1eXIrZnZOMWFTOW9tQkJlWTBMVlFOWmcrNEdM?=
 =?utf-8?B?VXNvTEl2QVMxdFdaS3dPTHp5aTd0enpkT0NGVUN0cnhuU2ZIdFFzZ0tZbnZE?=
 =?utf-8?B?OWp6NFV1Z25BdWhVNTVOQlFTdTJxazZLRTZocU9KTG5LSmMrK2pQeVhQNDVN?=
 =?utf-8?B?THZlMVlkdDNpa0ZCeDM3QUJhVlBrS3JlZW5RbTh4TXhwZ0N2cklOQ01WQVNO?=
 =?utf-8?B?d1JJOTJYMmlVUWFRZkZITVl1M2JvdmR6RnZkcXQ5RVBBbWJwNzBwZjNTbTF1?=
 =?utf-8?B?TlNUekxZVXo4c3JLb2JiK3U3UlhwM0V6Q1VwdlRSRERWMkRaczIxNXkrZnJr?=
 =?utf-8?B?V0dGSk94OGhFK0NkY2pSclNTVjhtSmg1OGNQT3lsQlVpNFFoa09TdndVRUFv?=
 =?utf-8?B?TzdackhVUGdZclo2WDErdGhid0s5ZldUdGI3OU16NGwxZi9ONGoybE43WjU3?=
 =?utf-8?B?Z3FjVXNsNTRwbkl2QkxZcy9nSGFwd2t4bktSdWRRa25TVjRreVRTaHhGZ1Bp?=
 =?utf-8?B?RnptUFFoaGdLaFRuV3BOTVlaazdhTUEzemFtd1BMQjVZUHQ5cWIrUysraHZ6?=
 =?utf-8?B?SVkyQmlOazQweXdvV082U3J4VityM3BJRHNlNGx1QmdyTHJiYXd1VGZvcldP?=
 =?utf-8?B?SnEwanZaMDVld096dlFER24rZTNHd3FTUlMyb3hoV21iQ1FBVERHQ1RJbE55?=
 =?utf-8?B?LzdUTklTUVg2WWdKOXhpNFlqaFRNYWtCeEZ1MFBua09xVERVbDBnVWFXL3FT?=
 =?utf-8?Q?Cy9Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2QvdzNQbGRzZVBFNnEyZ21DZTBwUk8yd3dveDQ4Y25xNmdUdlJzd2xacjdJ?=
 =?utf-8?B?anVKa0phU1NaQm1jTy8vUnE2VGNJQjA3czY2bDRZR1M0U3QvN2lWVUdtVXZF?=
 =?utf-8?B?dmNwN3piamFZaTArUm0xVkg2SGhSSmdlSmw4L3p1TnFKVFVCR05xVVBuVzR4?=
 =?utf-8?B?T2dZZXhEVXNjNVhJck9QVjhDZEtzbWtwcDJCZkV1TUtUMGxDRHJjYUlGQ0lX?=
 =?utf-8?B?Q0sreXovUm9MUlJDeDR6N0tGRVRISnZkMm16eURUeUNuK3RqTHI2dWVqaW4z?=
 =?utf-8?B?emtodHRqK3RFa0ludWZMZmZHTzNxNVRzZkwyTUxJQUtMbFZybUtDNDU0eUVx?=
 =?utf-8?B?amdIYkhxcGIybXNSMkViWVRva3JTajJtNXJNQ1kyT3AxU3dxTHVIZGNUMWt6?=
 =?utf-8?B?L1JMYUZPNWlzb0dxUksrNWplL0kwS1I5Wk9vYUJvaU15ZzNnTC9WK21mQ29r?=
 =?utf-8?B?dTdLa21QcTFZTFp6czBPa2lKa1lCN3RwdnduZUdnNC9KL3RncEVLUk9WcjVC?=
 =?utf-8?B?ZE03QUp5Mzd3RlRLdzNHaG5oWVBpWVpJU2VGZjFCRVh1UW4vMi85NGhnRzF1?=
 =?utf-8?B?Mmt6c0hxblU4WkVFTHNLL0dFM1RtTHpZT0g1STBZQk5tcVZ6VlFjd21WRXRv?=
 =?utf-8?B?cEpjYjIvRUF2UW9TSlVuczVQWGpqb2Zkak1ibGJ0TWFKUGN0eUpiaEJpVy82?=
 =?utf-8?B?QUxxZk5aVHk3TjFyMWFsUzArcDlMZWFwc05hOUhyS0k0cU1kK25wMlVjLzNv?=
 =?utf-8?B?eVI5L2l3ZW0rek85UkMzMDJPVVQ4Y1JKenphMWJ4VVN2UkdCTmdBZE41ZVdo?=
 =?utf-8?B?WTN3eFI5UDNZcUhXTUNMbmkySldERm9aNFc0S0lUYnIrWjdxL1h3OXJPL1VH?=
 =?utf-8?B?UTN3aFBWNEUxaDlmQlNhajlPb3VRYzhvMkplelBKNXQxNzgweU9VVHhkN0U4?=
 =?utf-8?B?RmRrc0FxYU43SVpKRFNLWjAzaW1rTW4zNy9IeW9wUmtIV3ZHMlpEM3V5Nkto?=
 =?utf-8?B?a2FjclZKSWFEZnRzaEo5Y0VBd0RiTk5IdFFhUjhyWSs3YTRpUzdZa2xVcVQv?=
 =?utf-8?B?OHJQRHRuZVczTVY0TFh4YitVaStnUHFBY3VuQk1lWEZUQXltbDg4cWdOTklB?=
 =?utf-8?B?dFI2WGRiOWtpRmI0My9oTm1DRTNWSXB2QzRpQmdoYWpvVzBOOHFMaVZGcTdl?=
 =?utf-8?B?SEJuMG9kZjBwQkttR2ZmeGI4N3I1bk1mVWtybUErSHNESzNyL2l6MzNhWS94?=
 =?utf-8?B?RXRCMGFsckUvcGp3Mzd1SEdONmFMS0JXRU9uWW5UQWI0S010NWhGSmhxcEdE?=
 =?utf-8?B?NHU1TUhuZHROK0xpRFJrUHV5R0VyV2JQVDVQRkhOWEpkWC85Y1VUaCtVdE5r?=
 =?utf-8?B?NU42RUpnTWlXUXBiajd0U1Mxd0R6ZU1UOWRHWHBFZXFyd3YxUVpjblZtM1ZV?=
 =?utf-8?B?UzVLQ3hyUnZlUmRUYnM4cUlVVHJvQWlFOWs2SHNGZWNwaTh3OS9LZDRCQ0ta?=
 =?utf-8?B?Zk1CcjN5cXEwVGJreWFiYkxNNTR0NFpkWHZuY2tjK1FPaXdYWlhSTHF6dHEw?=
 =?utf-8?B?ekxETHk1aHRKeWwyU1NZcUUwRU1JNE1pTGhpcTRpK2dHNFpIYnc5RFNyQXZV?=
 =?utf-8?B?S2dTRTFuRmd4Tm1OQW1UVlVIVzRIcUJxT3hrb3J0cHhIU3BUWG1wUGd0Qkx2?=
 =?utf-8?B?Q3piWjZud2hMUGZtMEFZZXgzY1RxdmgxZXE3QUh0U0JsdFdENmM3OHlLRjhE?=
 =?utf-8?B?YktIbzA2ZGxOT2s5SzRMNHpmZHdnUjR6dndmL0ErUExzK3JrTzBQVkY0dllq?=
 =?utf-8?B?Q2ZLVnYra1dSZDcyTTRFQ3V1M1NFcTQ4Tm9wQWRPOUg2cStMYkczc3pScDNS?=
 =?utf-8?B?VHdvVVExeFVENXRNQ3NxRjVuOEdQQlM2MFJiMGhsd1lrZzVOUERsYzR2Tnd0?=
 =?utf-8?B?SzhmRG5oSjdxenBxMzhOdW51dHpJOUcycSt4QUNsOGtGcmFNZk9DR21lYXlo?=
 =?utf-8?B?SlJwTHZqdDFVSzF3bnFuTmRLekZXQUhTVVNSSFZyS3B4b0dWVzU2a01neHhZ?=
 =?utf-8?B?eDlYbVBsOXhPT293STRCa3lCNjN0SlE1eFVPa3BScFIyWGdGNE5ma2h5eTNy?=
 =?utf-8?B?QXlQcXR1eHdFNHllY3ZXZWlWT04zZEp3Mk9reXZZNG0vYlRpQ2gxRjVIdTRq?=
 =?utf-8?B?OHBjMWtYb3ZINnhPc0RGNGhtRnYybW1vNkRrL3FHNXlBM24yamZMZVdRZjVw?=
 =?utf-8?B?b0VSZERzUyt3aWhUSk5zbW8zZ3FPL0MwMlZURk56Um5oQ09xbHlWTTc5R2N1?=
 =?utf-8?B?UlVuZGhNaTdPTVVIOUo3bzRtWXlKYnp4ZEpWUmYvR2tQNllJR2VvMzhyL2Q4?=
 =?utf-8?Q?LwWBdqFgb8F0cSoyYzn+Wt7YpYCW+p4C1Ra76?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeeb185-82a7-4aa3-0ce5-08de5d9727de
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:28:13.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqNvcmGfbIeGUl0pYR1Ef3p/zwED8YW/RCV1Yz7TvBtl3UyufAPuGQMdDZj8Hp68HmS1Gkut0T2MzVoFTHfKKiHHYFzxrMUzkXsbyug5Rf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9096
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 11:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8731

Hi Antonin,

On 1/27/26 9:18 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 056f69249..49527f45d 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
[...]
> @@ -224,18 +220,21 @@ section.
>         Resolving deltas: 100% (2447/2447), done.
>         Checking connectivity... done.
>   
> -#. *Initialize the Build Environment:* While in the root directory of
> -   the Source Directory (i.e. ``poky``), run the
> -   :ref:`ref-manual/structure:``oe-init-build-env``` environment
> -   setup script to define the OpenEmbedded build environment on your
> -   build host. ::
> +#. *Initialize the Build Environment:* While in the :term:`Source Directory`,
> +run the :ref:`ref-manual/structure:``oe-init-build-env``` environment setup
> +script located in :term:`OpenEmbedded-Core (OE-Core)` to define the OpenEmbedded
> +build environment on your build host. ::
>   

Shouldn't the three lines above be prefixed by three whitespaces?

Actually, probably should be 4 and have two spaces between #. and 
*Initialize* since that's the rule we have for lists. I see most of the 
lists in the diff in this patch don't follow the rule so I guess that's 
not a blocker :)

> -      $ source oe-init-build-env
> +      $ source layers/openembedded-core/oe-init-build-env
>   
>      Among other things, the script creates the :term:`Build Directory`, which is
> -   ``build`` in this case and is located in the :term:`Source Directory`.  After
> -   the script runs, your current working directory is set to the ``build``
> -   directory.
> +   :term:`Build Directory`. After the script runs, your current working directory 

s/:term:`Build Directory`/"build"/

otherwise this says "Build Directory, which is Build Directory".

is set to
> +   the :term:`Build Directory` directory.
> +
> +   .. note::
> +
> +      Alternatively, you can source the ``init-build-env`` file provided by
> +      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
>   

You didn't answer the question on v1 so posting it here again:

Can we set up using bitbake-setup and then source oe-init-buildenv from
oe-core? Or vice-versa. The wording seems to imply that.

Isn't most the above not applicable if we use bitbake-setup anyway?

With the three whitespaces and sed command above,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Please consider answering the question even if merging the patch with 
the few requested changes.

Thanks!
Quentin

