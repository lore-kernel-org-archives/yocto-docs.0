Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA40CFD62A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:17:25 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5410.1767791842846152283
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=i8DcitI3;
 spf=pass (domain: cherry.de, ip: 52.101.72.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upHhvuJ5D17T3XeEl2AhmNSBlyyeu3hcHtW5tvKCkwS3DP1Z1xt7IVeknPPEMAExas3fIL/AjmiCQRaB4dkiiEY/f4mJmXpGwL9xSuMug9u2FC97Aq8soOJ4zdQGniVI/zE0iIW2U6/QguCS9vdmoQyynFDAoRzs+8CpmzQ4bOWO2+Gny7nFiN55oEJ89XHPOChz0skTR0s42W6Iq6nUfrCrPWPlBtI4EppmXlNtOY/TjzAoYG/kzWtkwbjxcz6WiAQiqdnAzHBelPuBEvxm20yLtTfAJgEDp11HTbo/1MNnloaReFibJSaNlxmGsehfJcMEDNhgfXFsUzo74SuJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7it3MrQj11aei4jJe8wqgVO5k0TsFRm9lpUqygwcrw=;
 b=pSGGWv7Sks2bP8hWnBAXl4jmVOeLN2qN9hne8Zagb6yRzv7LfqCQhGx8URpQshSs7tPFf7Djq2B+STb1Y24djLyAyH4aSO1LoJ/3N5pdK0wQhX/fWcSfOVeUoOMW9nPTjf6aTS6ZP1GWYnjSiBEhkO+o+u8w8KS5XH0CD7oWjHw0ZBzoE0GVCqGOEc2cf+fkki5K+QZxM5PZyZSJdXL7dXvdwhU9T33EW01RnJUvN4qTzgrPTBCxaKwdeebIdS+p9dd0lljO+5mLCIsDCMbIvc5awQN0GmhOvGEstaArP9URbbHKXkGNIkm1TWwQT8kPGcNNKm2C/59nLdcDg8vHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7it3MrQj11aei4jJe8wqgVO5k0TsFRm9lpUqygwcrw=;
 b=i8DcitI3Zok+nGi6mN1vP6Cq9F33P8Awa4PTTutj82/O2TYinkeWtk2Qpyz+QSjbt2eAK7byEsayQVdb0kDVnOE4r+/y+yNvGRSdR0jPcZsRZ7PGPplMN5QznsIViTWvVPaZ7i8OxzZJPpB0Q5H/rnOPRrt/ShabY+I9q6X2uaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB12080.eurprd04.prod.outlook.com (2603:10a6:800:315::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 13:17:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 13:17:18 +0000
Message-ID: <95d28d64-2db5-4281-b2e0-2a42159cd891@cherry.de>
Date: Wed, 7 Jan 2026 14:15:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should docs explain unversioned recipe files and
 unversioned append files?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <fbd1c18a-ea92-1a7b-14bb-2ccbf0400828@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fbd1c18a-ea92-1a7b-14bb-2ccbf0400828@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB12080:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0b3acb-1697-45a4-198c-08de4def152a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEppMkoxcERzbjRQTUZQai91bzIrU0lBbm81UlkxaHNOWWVyanorVDhNcEtz?=
 =?utf-8?B?dUFsUWFTQmc5ZHN5KzRQUG14MkRCZ01LVzZDa24yKzU1QTJxZHJ2NTBnQWkv?=
 =?utf-8?B?M1hvaGJIdUc3MW05VWFzR3I5T2ttQ2tWUUhEVUZOVXZuSmdpa1o0OGF3THNu?=
 =?utf-8?B?K3hYbS9yQzNIZk1rbzhXNGZMY3pCdm1tUDVFVmlyemd6YjlkeXMyakNGUnRY?=
 =?utf-8?B?YjZlcFVJLzBHZEZhMHJpUHlBS01pRmtwNUhOVzBKdFBKOTBtaGp3dWl1RGc5?=
 =?utf-8?B?bzNLOFkyQ0M5QlZHampWVnp5K1ZSUlpVengvdHdJWXlTTG9pbGlDdXBtbHBh?=
 =?utf-8?B?Qlp6K09MWjE2K0NZNHpMR0daVmdXOG5aV0xVL0lmN205bFc4VEtXSEM2eHB4?=
 =?utf-8?B?THdDM2ZoNFZSd1daV05mSU14M0pVSUx5dXphZklKMnZNV1FSeDUvdXlONTVP?=
 =?utf-8?B?bEN2NWdUMTg1TmE2YjNwM21Ld3lsUTd4cmxtcGdIOXBQQXFURFJ4N21yVHZX?=
 =?utf-8?B?WDBtZ0llS0tRZDdXOFhVc0RwbDlCV3VNb0U2VUFyRzVmNHl5VkFvcmtWNVBm?=
 =?utf-8?B?ajB2RmZoWlhyNVJyTUp1cW1rYmN2UmswREl5QUs2TDRoVDEzMFZCaDlaMEsy?=
 =?utf-8?B?QVBCZHM1VHQ4endsSkp1bEI0V3daWGhhdkhjMUo5eENYdE1lRUF6M09xeDJn?=
 =?utf-8?B?d3NtcFhEa0ZaczlLSDg3andUalNXSSt2OHI1Q25MMDF6d0hnMVhDTVNXcWVL?=
 =?utf-8?B?U01xUHVXMlNNTys5aE9JLytYcktTUGxsOFJ4QTNkUW15dVp3RmZkQUVSeUdi?=
 =?utf-8?B?T2x5aTQ1ays1djUxYS9Qak1NcC9aSk91bkdOcjg2cy9HUThNMm9RUEI4YVVB?=
 =?utf-8?B?SG9mc2FOVDI4UEJKbzNxRHRya0VhTUt2c1N4Q0NObGtCNkJGdEVrbHh4SFBl?=
 =?utf-8?B?S0pvS3Rwd2FSaFVuWVh2RGtqbnE4WXZhMUtSUEdXRGRsemJMZkRtNVhvVVQv?=
 =?utf-8?B?Mjd1clVMRTFHTVMvMFNwTVpjSlo4U2VoUS83c1FmYzkvZnp5OG9kbFRzbnJa?=
 =?utf-8?B?dWFkd1ErWGxUYXhDYm5OVnVZZDhrVHBVeEJpeStMVHA3SlhnRThDREZIR2tX?=
 =?utf-8?B?NGpYakY0UUFObzJsSHJnbjJURVlpeWtiR3p4bU9Ra2hTODVLZEFOS042ZzEr?=
 =?utf-8?B?eDhoZmpPUEZzUGd0VEdMbzIzOE5WVE1TeXdEaDJ4RHNCOFplQ0VpVlNITGxF?=
 =?utf-8?B?L3pPbzFSOHRFa3BmSEw1alRIOEJidzk2MTBnVUNOWXMrc0RuVGE2Q0s4UVU2?=
 =?utf-8?B?ajF3a1pBNmYxaHNYTi9scWxpOTdUVjdxSmdHNVd3RDZhZllNTHUvNDhrV1VV?=
 =?utf-8?B?TUorNVJ1Qk42aVhUWm1adGgwZ3I4RHZBb1RVaFlmMCtSMXFwRi9zKzNqWkpV?=
 =?utf-8?B?bXRiZStZOVNnTUkzeHl4TEVaUU1oUkUrc3o2bGFyUzI0Wm9aN2F0NEpWeEF3?=
 =?utf-8?B?VExvcFo0aGJMNkwvMENpNkdnTUNvd05tV0NYOVNVWm5RR2h0K1FWQ1NjTjdk?=
 =?utf-8?B?bHlkZHBuMFJQajY3emZMWWpQUGcrd3dWRXovWHNCMDgvWVl5Z2hFMGtaRzBF?=
 =?utf-8?B?dHo4WVdQUEVqaWRULzc5V0hFSzNxdlQyMnF3ZUFTQmF6bjVYSDhOc2F5YVFj?=
 =?utf-8?B?MHBJVWlQSWc2ZE9ncnJNZ3YxaGJPalJGY2lIbEtXRWtOcDNKS0tlRnRjdmli?=
 =?utf-8?B?WFFHK2pGbjUwR2lEMmRmSnRBYzFLT0tENjNWYUlEajBrV1o5QU8ydllHRmxO?=
 =?utf-8?B?MUhCSloxKysvQ0JlVzRsTi9JRVhSZHZBbnFSYTRLL0trdndpOXRFRlQzU1ZS?=
 =?utf-8?B?ZkFpWWdPS2YzN3NpemVDSFRPK2I4bUxGZENwZmpWMDR0dUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTdPaGZjNWlrRG4wY210bW5hWmJvdGtsdU4zcjNNQ3VpWnBBcTB3MjhFbmVG?=
 =?utf-8?B?VjJ0ZzNBUklmVytpSW5IaW9TdWtUZHNHNWh6dDJFMjQ5M3VTdXFrOU9nUHJM?=
 =?utf-8?B?d0JIVFNkTUNmTjdwSUh3ZTYzb2xwUUY1MEJsNmM5MWRDdmxpaHQ2ZnE2aVhn?=
 =?utf-8?B?c3NON2pWL3hNWnlGRU8rdFVaODFVbWNNWmpnZEtkTVpPdDZ6Ynk2ekZRcWFI?=
 =?utf-8?B?c21aSzA1UHM3NU9wbHJlaFBYd3pUOFhUT3JsWnNRSGJ3c0JMdXpJanZFOTFl?=
 =?utf-8?B?a0dWSnJ0VTYraWVsNW1ZR01CSzNNbGVPR3JpZlI2TjNtQkpXWmc4RGpONHhI?=
 =?utf-8?B?SktTeFJraVc2RjFGU2NuRUllQUxuOFNya3BGUjJid09kS3hvR3BNdGFZQW4v?=
 =?utf-8?B?cDdhdEpnQzFaU25ZM0tyR0R6U0xKN3pCa01PRHkybTlCdkVsSThEdHZxdlVz?=
 =?utf-8?B?b1BTQURLZWkyT252QkpyQURuS2d3T0Z1QTQySHQwUHljZmtFcVB5NXpKbTZy?=
 =?utf-8?B?bmY4ZnNOaXhlMHlxam9TUjk4MXhoZTZxY1IrTHhJUmIrNU0vQkM5KzZqSFBs?=
 =?utf-8?B?NnRIWW90bzR3S2g1eGhlcDVkMC9JYVQrWllpMGRTaE9PU2FkVFFQeDdlUlpJ?=
 =?utf-8?B?bml2emZ0QzVjRUpFaUxxRjB1ckNoT244aHhBWkRVVGdXRThwcUNFTGhRTm5R?=
 =?utf-8?B?czUzQW41NFJwZTF4d0xsbjg2RUJwNUxhWjhXTWNtSUhKd3VTUTV5N09ScSts?=
 =?utf-8?B?clBHK280WURCNDNoeDA2UXl3V3BKTGorM3lWRGtlekt0RWwxZDhQSG15ekhz?=
 =?utf-8?B?amdGWVA0ZmxYNmpMOW8zVW1tcWRtd2xiVXJoU1liaHVDTHJvdExzYW9NbDZL?=
 =?utf-8?B?d2w5ejJhbGgzQTA3SW1WTlRaUWVqblRPWDhaSlQ3ZDE4RFlFNGxaRGxrM1RU?=
 =?utf-8?B?THM2dXFKOTlPRFg1enl3cWVQK3p1ZUdINHZSUFl6K1MrY3VhMHNKY1BEekto?=
 =?utf-8?B?bHJ6TkFtOWE4RDJ6SzFXVHEycGtrYUR0amo3aEJUQ3U0NzFIUXVzY1d6KzN5?=
 =?utf-8?B?MTBoSjk1ZmhLTExPbnE0MXYzODZJYTdDK1BMZnVWTksrMEdtMGVhRnZzcDM0?=
 =?utf-8?B?cjZBYkh3VEdKcHkrNm5XdVRxdjJ3MTdjTWxvaloxOXVUNVBoRVlUbklvL1JV?=
 =?utf-8?B?QWNSQWREM2M5YTlQMm9OSGNlMnh2K2kwYk1mRm5KZm4vY3lJZmlSbkV5SjRz?=
 =?utf-8?B?TDd3WmxJWll5RExuSENvNFFyUmZlcWtKRG00cGNrVkJ6Y1U4a1dKUUR2STlV?=
 =?utf-8?B?SVFvQ2pQa214L3NsbUNiNDhWelJ3WTFVSWZ5YjcrUWVIVE1YWVNuWEhRQkpr?=
 =?utf-8?B?NjNJZ1EvVlpkWVlxeElmWmpMMEtRQk5PR3pBc3pJQkIwYVNmUTQxbGxpSHNF?=
 =?utf-8?B?dVNPWnZlVGtXTmk5Slo0VEx0UDFSWDl1QWdCcE1mekFrdEF0cHV6bFdpRHFD?=
 =?utf-8?B?c2wyS2RBRlZBelJZKzdFV0hickNrYno4b0xBYW1YM2RvZFZBcGdGTFArNE8r?=
 =?utf-8?B?QXcydllUaTNBaDVLMm50OW9qRmdJRUx4R2kramlMSzRaWm8xdXl3TzlvKzVS?=
 =?utf-8?B?NExxSmtaYjMxNXlmbmlDWm1hWk55NEgxc0V1NXNhdTlJdDlQVU8xTDJYVzl0?=
 =?utf-8?B?cXJPZzVzSGFjOXhnQ1RabEVsUFY2bXduR1BsRnlWbStUUm05UWlWRmhpUTlB?=
 =?utf-8?B?WXlxa1NoNHpnaEkxdkxXN3daK2UyVW11bUx3ejhvZHBxcGlrVVhXNklzMFlT?=
 =?utf-8?B?am15VmxXbTI0WlcyaGJ3Vnp2dUdrNGZpbjR5ay9NLzVaKy96Qm1TdHFZdjVh?=
 =?utf-8?B?bzdkemFtT1FhVnEzQXFKQTk4YXVEYi9CVUlSanpNZFZtcTlSTlYxTmdzY1Iw?=
 =?utf-8?B?d3o2UFB4NzFQV3d0Q01PVFA1ZEp0b3A3OHFEM000cGVNK01XalR6bTZUb1oy?=
 =?utf-8?B?aTZoZXZ3QVpRcnhRTllKazlJYmEyamVnRTJwaEQxOVYvTlVORk1EZmFhSjB2?=
 =?utf-8?B?TlpUZGV5cEYySElKRm92T2w3OUFHV2lHMnArTzVpK2JneUZRTlBkb00zSEc2?=
 =?utf-8?B?UWQyZ3c0c0tVaVdrdDVSRXVPYzRNK1JZbUdiZ0k0aHAwQWxXeU5raGJ4eG04?=
 =?utf-8?B?Ryt1dmZDK1MzeWR1UE1kcVNnRzBzWGkvaFdHV1dCVkFzVnJmVnRnT0tsQkZ6?=
 =?utf-8?B?cU1FdlF3Wm4xM1ZMSFFTOG9TYmRXREQzempKSU9vR0xERmpWb2ZpRlQreXFO?=
 =?utf-8?B?T1p4cjM0ZU5nNTlSVjdvbVJxWlJxdEJqUmdic1ZhZXpld3dTcHRTQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0b3acb-1697-45a4-198c-08de4def152a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 13:17:18.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VtPteV5A6QwsvR3icTigTKlKzMbCmp9bU2wGP7zCNz0wntKWuxbvtZyRBxX4tmUyo+D91+1al/vumqURGdqIDlBquH0+XhUkLas5Z5AIJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12080
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:17:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8405

Hi Robert,

On 1/7/26 2:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    one more pedantic observation about append files and corresponding
> recipe files. occasionally, one runs across an unversioned recipe file
> for which some other layer has an unversioned bbappend file, one
> example being the "mesa" recipe:
> 
> $ find . -name "mesa.bb*"
> ./meta-raspberrypi/recipes-graphics/mesa/mesa.bbappend
> ./meta-freescale/recipes-graphics/mesa/mesa.bbappend
> ./openembedded-core/meta/recipes-graphics/mesa/mesa.bb
> $
> 
>    so what is the rule here? if a recipe file is unversioned, then the
> append file for it must also be unversioned to match? what if the mesa
> recipe were suddenly to become versioned? would that append file still
> be applied? the docs don't seem to cover this possibility.
> 

Can you try and report to us?

- does mesa_%.bbappend apply to mesa.bb
- does mesa.bbappend apply to mesa_git.bb

Considering mesa.bbappend applies to mesa.bb, we should update 
https://docs.yoctoproject.org/dev-manual/layers.html#appending-other-layers-metadata-with-your-layer 
to mention that recipes without a version in their name can also have 
their own bbappend following the same naming scheme.

I know that u-boot%.bappend also applies to multiple u-boot recipes, see 
https://git.yoctoproject.org/meta-rockchip/commit/?id=ebfc42663d52f2247b7de5d6267b353887cc2d91.

It'd be nice to check (and document) whether mesa%.bbappend applies to 
mesa-foo.bb, mesa-foo_git.bb.

Cheers,
Quentin

