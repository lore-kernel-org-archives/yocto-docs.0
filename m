Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD18DD32D9C
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 15:04:02 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7806.1764947041551228992
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 07:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ak9SIJxe;
 spf=pass (domain: cherry.de, ip: 52.101.69.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDlha6o/jrKPuraEBuPIHXlobJaB4ai8mIc82EPsq38sc529tLEfqVWazGh3Q+ssSkrDAY6kq10HKHiktWpeK8St7mDGJjAGMqqOQw1iV2o4tlFWb818+8Mp6+P2etkybwX/QpyjuOUPvgSJ50jgStN4v5/TujHWgtZBAtA/gnqBig4YCVivjpcvMmnJdLKWueNFW4ze6stCbx0Z5wPYchl6uL/bkQoxtxCrKzCYbpRqxmOgMCTwHQRsrQ3ypM1pCH1HckPrwiUf2QagpXK4vE0kDXWcl4trnimwRR8tqtNJMZRwhmto+8QH641AduJrQZcpDZMPOONx3OZ5VaFkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mneDumcvSAs17JF83Nnv0bIzpVogRQar6n4NshiWRI4=;
 b=S6Vz/Ey+CHlbNTt3l0zHLtD6+SqoK/K9JvCvz3CZMIDA274rBjPuOyV3Ey95jIhKJnccruz2fyuoSTFyZJJx/lSoRPE/ImqnD18WQfvFV2FkNDwIQSiMYm09HBw7FKo4EgqmBudHDj254608EhMLPKC26I2mIy9i/BtIA4ic2AhGX43JCYWgAnOBl+uxYzQXVaJyv4jElkZNDSWWU8WcYY8i7qGZLvVy6Rn9q2h4b9qqOvomQKHKNfSO6kU5qmxBVLmi+INVZRgI+6DmK2pTiF+sZyOYqEywaQvIE7Uins7si0HdCS48Ah5R7UlL9dyzV+gKF8XDeiPsZoJ5yhevaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mneDumcvSAs17JF83Nnv0bIzpVogRQar6n4NshiWRI4=;
 b=ak9SIJxeBybx5CAYUR+JKBGxcSUjCohutUgXT/3z6iy9SncZmbin6i53e60fCgRGMDJmcFGPOGkT566Q4YdJ1uAwJl5DO6MSwIjY4M06TwyPIFEyzbM6N1SJyZdRTrhSzlcsYzIw6KR7Br8Ypmm4sUoKnIyUkZM/uFzXX29n7KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11960.eurprd04.prod.outlook.com (2603:10a6:150:2f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:03:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 15:03:56 +0000
Message-ID: <e81c4d94-7666-4cf1-bba6-9a4a2ea4d4db@cherry.de>
Date: Fri, 5 Dec 2025 16:03:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/5] Makefile: fix rsvg-convert --format
 capitalization
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
 <20251205-build-docs-container-tlmgr-v1-2-de30623e664d@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-2-de30623e664d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11960:EE_
X-MS-Office365-Filtering-Correlation-Id: 3288b004-cae5-41da-e78a-08de340f82fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjMwV2R0SCsxWmo0Mlk5eEh4eXVnS2l5N1ZmZkl5azBYMnR5L1VuS0I2U2xI?=
 =?utf-8?B?NFIrc3dtVFJMcHVZMHJmQkttZnFMNkJWSUdsRFZWdVZmV2hTemNuSm1hemRn?=
 =?utf-8?B?M044bHhPMm5pdzN0SktPWEtnTjR3TCtTRTBvTUd3OHQrdnlhbGRsekRsMnIw?=
 =?utf-8?B?RUdoV3c1SVI5UXIzbmRjcU5uV3VjYXR4S0hvZllkZjFUYllkdCtncHo1cnU0?=
 =?utf-8?B?a1gxSFdhMmVKN3A0c21rSW96aklwVTk5UmQwYi9HM2FmQnZVbHBLZTEzODdM?=
 =?utf-8?B?RkpKdU8rM01YQXVmYzVZbkZKK2h1bVl0N1BHSG0vTG5uVy9iVGprVW5rY1dW?=
 =?utf-8?B?VXRTZlFJQTZ2dXBCMkoyTVFFeXM2TXdrWDZFbWxaNkszb0pPQTlMUEpUbmJ5?=
 =?utf-8?B?bWI3RHIzZlJEa2RoSnpKQmNHajJMNnk1Y1FiRGpqek5ZeXBGVjlqZFNUQUtS?=
 =?utf-8?B?M2pqS3NjZ1FxbDVjejBWVFR4NHZ1TEV5YVRiUzYxZ2JqdDNDSjN2SW8zS3JY?=
 =?utf-8?B?a1IvL1hNaXkrYmI0NzNWQm44aUk3dFFIWGJyNVo0VXJta29FMm5QZGxHZDVB?=
 =?utf-8?B?aXdueWtGTmd6bG9INFdjNGdmUkFOL3p5bXVJRGxyY2t2UjBobCtEVWxoUFQ5?=
 =?utf-8?B?dlZlY2FzZmlNdm9HdjlodGlyc1ZtVjNkT3RtbGZ3Z3hqQ3ZhV24zSzNRcjh0?=
 =?utf-8?B?bW5Rb2MyRnNmT1dwVGFFUFBCV0RtMHJBbzFvMzVOZ2U2dElic2xucDNKWk01?=
 =?utf-8?B?T05qSmxzZG9xcE1HUGlhcGdkQlQrd2hpL012ZVJBQVRnYXdPam1sNForaCtk?=
 =?utf-8?B?M2hvM0czTHJROVRiaXBMTDlXeGlmNWdHWFpkOWI2UVdGd0NnN1IvdjByT3h3?=
 =?utf-8?B?bmRWbDg0Tk9mZXdyRTdpVDMwODIzY1JWQit0TzZpeGlVSmtRSnd3ZzUzaFRX?=
 =?utf-8?B?LzFrYllESGNaMEVnc1B0V0NFNlc3eEZLZ1RqY3dCZHhEQ25FbTdqOExQZnM1?=
 =?utf-8?B?RkpONS92NXIxcnV4SDR5LzdmM3RWWEhaMUJ3MWJ6MXA4UWF4Z0Q3SHVJeWNY?=
 =?utf-8?B?blp3S0RqVW1BaTRnNGRIMGRjbTZyZXIxN2NuS2hyN0dBbWk2UXRRUlNJSGth?=
 =?utf-8?B?OTlUUUxubWl2dEJVVGxIOVVaSm1WYU5tbmdzVUVESUdlRzNFSUw1dWVuNDRm?=
 =?utf-8?B?enFDNCtxRDRZNlFZeUlYSmJGd1NJeGluTFdBUllCWVZMeEdzeXplNnNOOC8y?=
 =?utf-8?B?R0xzTUFqT294ZHJPUVA2MVVubGMrMTBtZ0NTaFZTV3FVVXNvaGRZai9yRURs?=
 =?utf-8?B?VHlxa0k1MHp5Sk9tY1hJZzdVZmtNa1BCT05QaVNXdzJ3NVNtQTRNYzE4VUFX?=
 =?utf-8?B?TTd3VHphaU93d0h5ZVFHeUtiUmlEWWpLRmMzWW5TZ0RySDJQUjdlQ1BWYWoy?=
 =?utf-8?B?T3NkMTBSaU1tMy9vZEd4RzVSK1QxdUVkMno0d3ArZU5JbC9RSURlbmZTR2Zy?=
 =?utf-8?B?YTE1M0FpVmhTNm9STEVOOS9Jd0FBOVRpei90NkFFR2l0cC9UYnlzbW5paGl3?=
 =?utf-8?B?NjE3WTAxaWpGQVlPVlZZM3Q1cEhDRCtZQld5Y0tzczdCY2M3cU80QXBLcUI4?=
 =?utf-8?B?U1lTQk9ZTEtLWG1YaTlxdTN3cE5kMkMyZUE3T1JpRk1RTEkzZ1BVNEJPRnQr?=
 =?utf-8?B?NkRJSUVyZGVGV2wyWUNEQ3B6L0h1UHJYTitMQ1RaMC81NHUwcWVHalV5UFZZ?=
 =?utf-8?B?NFlhUVVMaXd1aHp0VEpQcTlKQ3Q5MUIyb0JKOERFdDNzUGxaZCtHVXplS09U?=
 =?utf-8?B?YlBTaFNVVXdGckRYTFpjU080eU9kcmJjSUdtUlhxZEkyRm9VR1cwUjNUdDQ2?=
 =?utf-8?B?RFVqQWJXOGFkc2txMWs4em5iY0s4SXp3SGdOOWtCb1UrQ0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZThseTA5QjhzREd3OGZKSWxzUE1NSExnU3Uyc25UbzF5dEdQeUtGSmh3djla?=
 =?utf-8?B?VmtzNWUydVc5VUtWeTU3b291R0EwTkpvMi9uTVh1ZEFyYmdRdTJzd0NhTUZP?=
 =?utf-8?B?SmZhamFaRk5meENmMjhDN092U0dlTmJCckhWamNLRDdlWVZXWmg0QUlocFFE?=
 =?utf-8?B?aFZ2VXFsMXpQNXN4blljTjgralZoc0s4TEpkWlBwWWYzK1lDT2RVMkp4UkNY?=
 =?utf-8?B?aTNwL1FEdENrcXh0cForRVdPOUhtZHdFejREWEtGNXVaSHR4RE9vdmNRVEpB?=
 =?utf-8?B?bE9pZk5RRkhKTVRmN3pFRjZaTWZlaXlQdXlwTFQ4dUZ1UEVJTFQ4MTVXenlv?=
 =?utf-8?B?U1l2cS9OMHF2bEpwT1BWdWhoLzlmaWx6TzJueXcvNkY1VWllQzRPRFZKRkNU?=
 =?utf-8?B?NWhOQTJRcmovVHk5dUs0bXErY3BFeUtnYkRVSVE1SWR4UkJYY29OMi9nUVFp?=
 =?utf-8?B?VzdGVlpkc2RRRXo4UnpZWWlNNUFXeUxVVHdRSVJCTDVrZ2trRGF4SlptaGhI?=
 =?utf-8?B?NVgwUDJOSzh5bkZPdnVsYlQxd0h1Y0VYYzgvQ1ZKcEpjaTlKN2lESS9LYkJF?=
 =?utf-8?B?UnFCOXpCQXpIeThMeHBIMDhGYnp2OTMzTzdrbTc2eXVIYkZNMVRrYUJkWW5i?=
 =?utf-8?B?Wjg3cU5rbmVKQ0ppc2ZOSmlBa09lTldRd25aM043dHRxb05BVXVweDhYamNy?=
 =?utf-8?B?YithRTlzZVlSRGpKNE5VcXhYTmFUa3h3V0hwUFpmdXRLMGxseWZGb2VSb2My?=
 =?utf-8?B?K3RNcTFGa3VrVm5WNFBqT2gyU0xub1JTci9QNUt5THlmMkdTUEJJSE9vRyt2?=
 =?utf-8?B?ZUp0RU1aZFFaMjRYV1dpaHdhQzd1bGFzMTQzblpLVVJIRE56SmRLbHZqMFFT?=
 =?utf-8?B?SVdEcGRJbnQ2dmhKTFM2ekN0L1owejRDbW5FVDJPWEpBR2ZTK2ZOcUdoOGow?=
 =?utf-8?B?NHZEV29RQUUvakFrNTYxTCtBNlhKQ0hLRW9oNVRlb1JtM0VsR0VDdzdGQkw5?=
 =?utf-8?B?Ym5FNkVHRkF0Z0dnc3pLejA0TVJKdU9mam0yd1dTQTBHdW8yTzI2S1pLR1ND?=
 =?utf-8?B?MWlHdVVscUVTM20vdmcyc3NvWGU1a3lWWEJSMG5qL0hwKzhsdGtISmtRK3Jv?=
 =?utf-8?B?T1dxeXJCWHJhemdUNjdqV0toRVFGNS9OQ2pZc0xFMGdSd2FaaFlta0dpTllS?=
 =?utf-8?B?TWFLcVkyTThLYnhVT1JmRkZDS2IreXIvUEJ6TlpqdVNJS25GUHhEL1hwSFBE?=
 =?utf-8?B?dGlnQklqVVlzSFFJc25JOUZRWWFUMDlrS01JbGlidVYvU016dEMycEhpaVdE?=
 =?utf-8?B?R1lKTEJlVExCalozbVBxZXp5d0o4T01pMERLU0dZTWQrbGM4aXJFcDBuV1FT?=
 =?utf-8?B?NDgrOEs5K2lVZEh1M2tkWldJL3E4bVRVakJBMWluQllnSUlNUWZIYUxTWTNk?=
 =?utf-8?B?dXVsbmRGdFFxaXF1WlIyQVcrYnlQdWlyUE1nVXBGamU2RWdxUGNDeFJJT1pE?=
 =?utf-8?B?UmNvTzdhSmVpcURmT2wwdnFDUkFpL2VaUzlnL0pTOTJBdVlQcUZ1ZWVBYkhU?=
 =?utf-8?B?R01oQXlFdCtGVG1GYTlNNi96blUzQnpPM1ByQjIyVlB3aE9NVnZSajR3VFpx?=
 =?utf-8?B?UDR3NWluMmo3SzRoK1d6RzZSWTUvUHVqZml2Qk1wZXBFKzhVMnl6aUpuTjJS?=
 =?utf-8?B?TXBlc1FCN2t5TXZpRFZNSE5ocHI0bEZzQk05RndZcUN6eU5jb0cyZUxVb01h?=
 =?utf-8?B?Mm4rM0QvWlRPYzdZT2w4MVozbnVnMGNoM0JvM29INVh5WWdZSU94VjJXaGpj?=
 =?utf-8?B?K3k1Sm9HeFhWTXJtQ1NyTUdjR2d2d3FiR1VHTC9KTGRnTDZGL2YxOE5VLyti?=
 =?utf-8?B?dFNHOHVZRmpNRDR3SjJPWngxZWozNzFxc0pLL3ByaDJGUzM0WnJ3SWZVVVpQ?=
 =?utf-8?B?V0RuVzVEYXIrdDByRlNMdTR0bnVhUGVxdksweVphMms0Rzh5eGErQVRFd3U0?=
 =?utf-8?B?YURoWG1NUHJiN0hWMlFUZDdadjd4MmI4OU1JcmgrVHNwVTdGS3oraHRBOS9n?=
 =?utf-8?B?N053TGZUUzNlS01YNWhxWTdTUit3Zk9WMi9ZQnJKWThka3FwQmZtNUtsYlFm?=
 =?utf-8?B?ZHdtZWlpQVEvZlRWdVBma1NSbzBJWmw4Qm00bmZPOTBJemh3Ymk2bjFBMDk1?=
 =?utf-8?Q?Oy6HihmDW3x0mdp8f1mHq0A=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3288b004-cae5-41da-e78a-08de340f82fb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:03:56.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw1YRFX6RhGcThgB/Gi3STRfW4gGnNkFUaSbLeDBARKuymSEuibaJHwqiXedh0ySRCjYrb06AomXXCPQmELe94tOOQQKwjz2USMHZSwvess=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11960
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 15:04:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8234

Hi Antonin,

On 12/5/25 3:51 PM, Antonin Godard via lists.yoctoproject.org wrote:
> On some versions of rsvg-convert, capitalized formats are unknown.
> 
> For example on CentOS Stream 9:
> 
>    $ rsvg-convert --format=Png --output=ref-manual/svg/releases.png ref-manual/svg/releases.svg
>    Unknown output format.
> 
> While the same command with "png" runs fine.
> 
> On Ubuntu 22.04, both are accepted.
> 
> Switch to the un-capitalized options, compatible with all versions.
> 

rsvg-convert doc only mentions all lowercase format options, so looks 
fine to me

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

FYI, --format=pdf is a "moving" target, that is it isn't always the same 
PDF version depending on rsvg-convert's own version. They mention it can 
be an issue with some latexpdf versions only supporting older PDF 
versions. See 
https://github.com/GNOME/librsvg/blob/main/rsvg-convert.rst#pdf-versions

At least you're aware of it now, no idea if we should be doing something 
about it. I guess we could try to be smart and detect the max PDF 
version supported by latexmk at runtime and select the pdf version for 
rsvg-convert based on that.

Thanks!
Quentin

