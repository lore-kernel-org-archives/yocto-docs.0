Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C9D0C85C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:34:32 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56776.1768304067035294313
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fiWrsZcr;
 spf=pass (domain: cherry.de, ip: 40.107.159.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciODkb0sa/viRPzTxe48Wb7Z27iu+kVdahFrDpoDLpoMU5i8lJerUopz3F6CSLgHm6jRPkGYBMhWSHer85RaqT/z4G8gFF1A3GeG78JucEz83nE6Shnms3JWbZgIB1iiFdly36JPqdzCGG1/k+/4PMmWtRNoZxiiy1pNCXVl3GCqOSFR6+iQ0f/laFxPy+5MA+V/b1fvL0MG+CNcOZhs8I2QgybmEMpLqXjFw28CkZwB88dyXl6wZ0yWmL98j8LwqhvgTGGjbw2bd7X8I28KJZyBDWrUWSK4AaTp8lOgeFhOoEXMq9uqEVOo0k2vtiF8eHqmlCClJhSuU02QCYsTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUNmvE+arDLAsemBIDi0y9mUqmQJSwnqfuDR+xYLtoU=;
 b=PJ+PpDGwveCRpy1eb1TObpr74zUAYX2flQ/iXRl9edt/fmxr8wZXFSJG+YdYO2kIgV4LvACu1ZZlD880y+Qa4FigxT1u+NvyI+zHysRdw6X5x3fnfPnCIoeSYXe9qwC/z9wUcmdwF1YqjvHBNJXDTM/NWunZtTagQk262XxoyPphB8RzVx7jfvsij+4q4f4MMBKiLK3tr7K51QCFdx+X8B4ZL8Q3x8DnIghsOQ8Ol4xKnl5MQa1BujOLA1pRmGvZhncQnU5VV3IISnoVr5PRYkFCOSDLXeUZxVKdhyabgeN8xWJBn2DlWtezMTY7I77iWXn+SzZqljWmDYHbl+Fffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUNmvE+arDLAsemBIDi0y9mUqmQJSwnqfuDR+xYLtoU=;
 b=fiWrsZcr2flnuYO04n+vBkkr3ezfO897uVcZT8MTILDtzgIEVIH/rscrQLhvGE2HMBP/lnHbQqlpeVPOmp+/jOQDOusKONGKy78o8lIsEPzhVCpeMJwP+4o/7hcA3IAwA59IY8I9XdxIrGWCgBbtON9rcnTUgQ/yB4vRrHN2b4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:34:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:34:22 +0000
Message-ID: <598900c7-8e2b-4453-858d-915cd4404859@cherry.de>
Date: Tue, 13 Jan 2026 12:34:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 09/53] dev-manual/error-reporting-tool.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-9-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-9-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 66538fed-ac8b-4985-3d3b-08de5297b2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?empvcXd5MnhlSDBmUmF5RnVpWWFPbGVRNnp6bmlwR1BnNXg5WVp0NFNCMXpi?=
 =?utf-8?B?YUNjQ1lQeThNZUI3c2UrN2svK00veFU3SE5PTnhET2lacGZDMmE4S1JPK3Fu?=
 =?utf-8?B?VHoyMHA1eTVvNVZGdGtEdFhsbWl4blM0NzFwbWZ5a2xVcHFEQmNSRGx5MVVF?=
 =?utf-8?B?RTl0TXZOaVk2d2dYYzNnUS9IWE91MktZb0ozU3ZzTnVDT0syVk4rblIxYTBi?=
 =?utf-8?B?djZSWWh2Z0pvNmxORDhUN1g3Yjl0VkdiRXpKalczK0YzTWdvUnFmVjBHUjBM?=
 =?utf-8?B?SmEwSnBTQ0NmTEVtazNYWE0rUkdMN2pHT3h6ekM3NjhnaXh5MEsvUSs0WVdk?=
 =?utf-8?B?WDFjVUtVempzMjFZWkdWQit1ZGNlRkhjWjV3c3hpTzdWMGx5Nlk0NitzUlBj?=
 =?utf-8?B?YUZQUmJkMnVBL2R3UUZrdnNmN3dOc0YyQUVuT0U0cDhIU1JLZ1ZyR0E5QnV3?=
 =?utf-8?B?elVWWTFiaXFDeHhhcklvenBUaFBsZkVJQ093b0N6R1E0WkdCTHJJYUhJc0F0?=
 =?utf-8?B?Qm9NM0dqWFMwMmhiSFZueHlQbkg4bkJMeU1vM3VtVTExUHVlOWx0dkd5VnZa?=
 =?utf-8?B?N3VLc0dxTkxLOGVhZEdwdkdnY1pSakNtd1FYREtOTjFrRDhCTXBzR1NjQUhl?=
 =?utf-8?B?eGJaVW1vWVc4VTRGMno3SlFKcWVBS1VGY2lSMmhGanNqWWdjaEtzaEpRK1hs?=
 =?utf-8?B?RjJSS2YzRDdKMEI3Rkk1eUtXU3ptM01FSUVUQkh6YU1KdFR3bjJocm0wRVoz?=
 =?utf-8?B?amk0aFUrQWdBWmQ4WDVYZUc0a3I3cWx5SkVPazBwRzg0dDJ5M2FBM3U4aHdV?=
 =?utf-8?B?N1REcHg5K29RSDVLb2FQdnZwNlFHQzE2RGFaS254MUVPb2NIa1doM3RaYy9Q?=
 =?utf-8?B?SjMzWlRXMnYwL2xwcFdZVE9zUUJOYTZJeVl1MWxsWEg2K2E0YnNZQ2lrVU5J?=
 =?utf-8?B?dFpqT2s1Z3VkUmsxZ0NXRVNybS91bmVTNjJkUTNSZzE1TzlSVnVscW1rNWtu?=
 =?utf-8?B?Q2d3UWpaMURsQ3krVVlQVEpSTHgvTFFwSWU3QW9NZzVITDBiMDVEeWpqbDhJ?=
 =?utf-8?B?OTRKbGs5eWlNbXR6bWhJZVpmbXJORHJ6REROdW1QVnVTSThTRlZWdjROc0RU?=
 =?utf-8?B?Q1BPalJ3NEJHclBxTDB6cTB1TEhaNHFFK1h6TXNmTnVnNjhCRW56UFJadlRX?=
 =?utf-8?B?REd5MzFzWi9aRkFKem5IMlRrWG5KbC9qNVoyTzhqcWVHNFFha2ZoQXRQUGtV?=
 =?utf-8?B?bXhxalRhTGt4Vll5QW5SWlpIaFk2bDJ0QThDbXlxMXc3WTdFTmxwZHN2TjlT?=
 =?utf-8?B?Wlk2bnJTRE1hZk9LWGVEUVZueENCWitBWEpZSVcxTzJuYXhGZkZJS2VhS2x4?=
 =?utf-8?B?ckpGbjBLRDUyVUkrY2szb3JPVlc1VlFDU2xPWDlIVm5NRDN0QjFFVHVWNnZC?=
 =?utf-8?B?S0YrTzMvM05yV09aelg0NjdXd3d1NnR3RzZpOHYzcGZySjJnbENoQVBMbWYv?=
 =?utf-8?B?bDZBdG1Ydi9XdnlCdXkzRkRUVnhOMFVZSytobm55UGlNTWk3dnlORkFLUWNC?=
 =?utf-8?B?djVDRStFYTFjTHc2bVd4bWxGUzBROW9ONUNVa2ZZTkV2S0pRTTZEK1cwTGJn?=
 =?utf-8?B?dmRxeTlBeUpoWTFReTZ2U0Y3U0U4MWhjM3gra2dQQXIyNVRZZnVlZnREUUh1?=
 =?utf-8?B?Wm1aWUNTRXNrZTlmeGZzNTZQZVArQkMrZFZ4cE5saFRrU1oxK2RBUmNRUHZQ?=
 =?utf-8?B?Yll3VUFrUEpycWRsaDRWS3NxWEVpQnB3SnpMTE9QMU9aajgrWmM1NGFLTE1X?=
 =?utf-8?B?NkFWL3BjellFZExQMUVRK3lsMWlaYmxwV2p4bzZIU2dIS0cvNUZ3VlJ1VENR?=
 =?utf-8?B?cFVhcTJtTHBuWTNiNEtZVU93U2cyUncwU0N3RWxSM1FhYnZNdXF4SnJ6ajdQ?=
 =?utf-8?Q?jyy+qDtsABCYi8a8U/TSfNNTZEfqatJ2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VU5VTFVpQ0YxRm1MaTVtV0Q5c2Q1dG9ra1VuY1F6Nk1IUGZzNzhUNlFqZnlY?=
 =?utf-8?B?K1NuSzA5bzNPTG1kc3FheSszRDZqWUNWSGFoSkJ6Q29rT0RwcmxiZU9jMnhP?=
 =?utf-8?B?QzdwV1d1QUNFaHJucTJ0ZjFoamJ3MysyQktwQy83M1gwdEJVdVlsVk5RTHJF?=
 =?utf-8?B?cGkwSzM2clQ4MUNJcGxSK2ZtUDY2V1hEYkxpOGFYeHRaNnJCQ09MZXc4d0VU?=
 =?utf-8?B?UmIxUG1IWXVzWEZMbGRIMXNOV3hTak1tSFpHa0NMaGgzNnd5QzlFTFgrNWls?=
 =?utf-8?B?aXQzR2s2RnUzd3hteEZXUTVYSUVIb0NHaVVMZktWSEVST05lUGxNM0g5dTU3?=
 =?utf-8?B?djBrbnBpd3R5QlNLc3c5cXBGUENUMkcvd0FKellxbEFOT3BmMldDT2ZxWEhC?=
 =?utf-8?B?b25wNWhQNkJiS29XMEFKWW1WZHhxNFIwbWpFTyszNFJ1aDUxQWtGQmxpMlNT?=
 =?utf-8?B?T0xvZkZPZkdDRGtZRldCek0vdGRpVjJyaXRPUkJiOHVKeXhJVkw0UE1BR1BS?=
 =?utf-8?B?enBlVVJhRXFONGFLMWYrb0xiL2ErRWEwTENQRHBsb2JnRFhSRm4xaGg0TitG?=
 =?utf-8?B?c0IyZmI4Y3N3RmxITWVmd3ZENjN2RzBFZlh4cTNVbVY0dHVYN2JGTU1JRlpV?=
 =?utf-8?B?YndiZ0RieXFubE9TYjhwMDdBVC84VmtKU0kyVFVQRzFadVp2aWd1NGgvMmVL?=
 =?utf-8?B?cXZVZFYveUFmUFRySzQ1cWpVU1dJRzBuLzFOVEd6M1dkclU0WGMzUkJodURs?=
 =?utf-8?B?c0gzOEo4WDRVNEpmUHFwR0tuMnYvczFoMzY5OTBVZ3ViZDhadXBjdzJSeHdS?=
 =?utf-8?B?OUkrSXBDQTdJdytqMUFSK2ZuMkg3MVpCMGdtOWJZd1hUbFU4UzNtTzNRZE9T?=
 =?utf-8?B?REk3OGxmTHdtKzc5bExZb0V0UzhNZjZtYlcwL3hEamorNlhBeWgveVpxejI1?=
 =?utf-8?B?UldXbUROVTdZanM0c0ovUGV3SWZvZEp2WUloS3kySlg5ZHE1WHJ3Q3VnOHZl?=
 =?utf-8?B?NkgxTGtRcS84dnB1cHhtRlN4NjY0M1RhSWlBeFhhTUR3SVk4Uk5zalpVQkYv?=
 =?utf-8?B?V1ZmY0R5TWJmWSt5a2h0c2wrWmhzQ1FYS2FiQ2ZSQ0RuSGpvMCtDZVJiUGFM?=
 =?utf-8?B?dWgyb1RyZ21tVThvMmc0Y01zK0duMkdOaEdxektrbnhLVHlMd1R5UE91Rmxq?=
 =?utf-8?B?cldXNHpGWjg5OGtSZEtudEJuV2FXVXlHQ2RYVVdQVWJ0WnNNci82YlE5MDFZ?=
 =?utf-8?B?NHo2RmZWWFVZU2ZMSXhUU3F2V2VLUUdzbnd6Q2lGMjBGWWhVZ0Q5RlBkNkhF?=
 =?utf-8?B?UmllUXpOdE1leUZmQm9lTnplL2FkTktvVkZPNkNqd0t3V3NNZFZSeEswT2Fh?=
 =?utf-8?B?UmlJMUZUZkVBSk5WODRqNkVaRG43R3ZMdSs4emU1YjM2L1U3eW5Ia2hUcFc5?=
 =?utf-8?B?cmFWV0VZVGhTMmlYQ2ZUMUZZU3Q0MXEvUmFVQ2tJckdQbThZZlNieC92Uysx?=
 =?utf-8?B?SVUxMjNrSTAwQ1lyZWtCN0xIMHEzc2hwOHVpd0orK2kxWllpTFJ1WUU5SEwx?=
 =?utf-8?B?UlFwS3JzeHV5RUJJZHVjTUZEN0tyc0tmdzJraS92eENSWXVzcmlPY1NlMGxx?=
 =?utf-8?B?ZEUyZW9oVEhuakIwNUlpQXYxenlQREtrdlB1ZGQ1SWovcHB1d3VrWC9EZEhT?=
 =?utf-8?B?OHJDWEpWSmNwbDdWVzZvSkJHSUhTdjdvMURxUmljcEp2V0RlZkdmNFAybThL?=
 =?utf-8?B?VnVBcDdyaTlIS0pML2JzMlZWb0ZJS3ZGQThicnJ1Y2l6Nmswb0hDQms3Nk55?=
 =?utf-8?B?ZTFjc0xKVlJ6RjJOQkZ6bExRM3ZtdVJDUFA3VUd2ZjltM3UzZUdyakhrNGxI?=
 =?utf-8?B?SzVyS211c0ZQN2ozT05HMU81WlJzQVZnYUJYOVY4MkVUUGgwcDFWOVB4c1A5?=
 =?utf-8?B?M3p1ME4rSlk5ZEFjUHBDcXd1ZDYzeW1vSGZDd003M0k1VkFuenU2OW1nTHVl?=
 =?utf-8?B?SnNvMm4xNHkwaEt5ZTNFcVZFYkxuWllQb1JQZmhQWDg4WnlqaU52ZnhtOGVk?=
 =?utf-8?B?TWlsaHhEeCt4NVJGZnh1U1BTTVNqZW5ZdFh6R285a3l0UTNMdUQzcjZmWitx?=
 =?utf-8?B?U3p2U1NSblZlUSsxNW9WdE4zNFZ0dEpQa1M5ZkhZYWt1b0czQlJFeHFZRWcr?=
 =?utf-8?B?dWcrblQyeGY1YVoycmNEd0ZEUDBEcXhjZ1YwcTNvSFhidEUyQmNNaDFFa1kv?=
 =?utf-8?B?Rk1ldFp2Ymc0U1RicG9mU2E4djJwUU9naG9ubEVwS1NiR2drR3Q0N0NqNGFw?=
 =?utf-8?B?WkowQm9pNDRSU0NVdUVmRUlqalhJeUJhYXl0ZmVaZW8yTjgwUTlVZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 66538fed-ac8b-4985-3d3b-08de5297b2d2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:34:22.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IkO3MEztoZHwcxol1x94zY0Dmt5aeZy97Ab4NtwbSDxrxB7w5jZX8d1GUkyBHobksnbrGQMo3g2WaQzoSxDBaVMwaQ8RLkh9a58GWh6hRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:34:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8490

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove the single poky repository reference in this document, after the
> poky repository was obsoleted.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

