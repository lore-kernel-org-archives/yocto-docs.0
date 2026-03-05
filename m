Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DFF30939
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:57:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41573.1772708219308176957
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NgEoNQJ5;
 spf=pass (domain: cherry.de, ip: 52.101.72.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3oKxhRH8yVyLyzP7xTDHMAcOrJBZEPAFBjWzgC8hj/uhBZO1VhSsE+PCVagzwu/ECvjzOVVth2vyXVzkijeO6efvw1MIKZlYvwx7iTnJP0yNJnwB8Ix+dkuXXk/6BVWG3h6yldhTyl85Mz1KipW6D2oyBCoBI5lxqpD14sW2DeoiJwBo0t5ohb+JmGBFbpL5YsaLnvEfwXO/AygMQivVIGGsT1ra54GGrIy9laZJYNoJako9owme/q7sgQuBmNRbMxgx4X8dv0AF2dSS3okwrGx0W35VNuSyzMxe9wnsaTFvL8WltznSQk5BTVFKr3doy7wehmnv41z0ClknU00jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91OGihzWrSXdpUvqN2Mw6yxNZgWS5mVyMkCldkdVGFg=;
 b=iZ6rXdAJc113p2F9Pvd6QQkBw1wOA1LriEtlTDWV1HmW0HAJJlF4emMFyi07dv6xckuxzIOrPP60Lwtk4kXSZBT8uvvXyhCmYSlOvHarFLher3Qhh87pYCx3MysnaDZ8/jTtbdTRy5075Rn5Wwt353HFI59pNwuhFCj84BKsfuNHpHK3lJ9UtVE8W8SIgyJ8Ch+0qoEk6xFwH5MiVlmQeJiccGhE54/qI5jtXov5JfHDzUS9NMm4GPTLONiHbED5lcQ32H3ZxtSg4HUJhVcwZRQLH8xm1eJIHWDhpzWKaPIdZLiN9/M6O/aw/mi05JSRFEXkG/a3RYSFqskiYSTIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91OGihzWrSXdpUvqN2Mw6yxNZgWS5mVyMkCldkdVGFg=;
 b=NgEoNQJ5Oz0XGGKHAaLqJhPi/CPEnE2npAssp6dGBdC0XT94rlBCKpRby+3avxHHQwxsTIKPcW3zQBTFJbWFof63ZDE8ahv15PRJqAiXXZHccdaPbAd6W0DTymYvVKaRb4/uAJJCSovHLWSn6PArqwsqV17bc91hcZPXJp+9Vyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVUPR04MB12495.eurprd04.prod.outlook.com (2603:10a6:150:349::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 5 Mar
 2026 10:56:54 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:56:53 +0000
Message-ID: <d9b03e70-0027-4406-9577-f389f4721e93@cherry.de>
Date: Thu, 5 Mar 2026 11:56:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/8] conf.py: define new
 {oecore,bitbake,meta_yocto}_rev roles
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-1-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-1-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVUPR04MB12495:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c112891-482c-4867-e769-08de7aa5e976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	F6RcR4rsh08RIcAljvVZxeL4AnEmmuasGH6Xee6h6i5WDAniT5uzZLSfkVWFMsmVhuTyZE3/hA7y3URpn0pzktJfLoxfumBRWrYBu42gMKSjkO23BV66QsF/oYsYjnZyUNXhvRKPP0dA9mOYchtbBs4dY2aW40nfbO/GN/zivN/MuWEIOruJdDESuLOzD3TeTLc1hSb/14SgOM2FqC8/tcwU4lhJnxdEIYBG2l0lCoHfDVp8BM7SW5MH0jCD1nA4W+pDq1x3rwHwRwAjNPBPdlid0qXZb81lFPnY425rxSGxYt4z0TYXlc5Kay0QFyrTTNKhz/IYN8aRjzRBe1HfMG/qqOTz8n8kiQV/Qg7k6XPxllzoEyNJVgH+EJu7JDlg3FfnxGSprrIyvigOM8232u41MRumIJSWwMKIENCKPEBdF7r4Hachkel5xcwbDnAaK6XI75H5cwbOpfLAx3mvxe/0EnnVYyfeE5HQd6ZtnuD/BTJXg0mLwaz0v54DmXT7JKfEfFzevhq8ltBRKTgqJG6agATsHFFDjojLjaI0/dDHtK+TA8KC004/ixGcyJO7ZrzWCQpzAu6lfQ5g/ILhTnGsvF8pvUfh95Aof2t9Ywl9qJv8hqXSE8MW9c10RK1thdAJZP1HHVuPGYz3AwhSlPtQqDmiVDQlQYAGS6asKHc4FPWftI66ld5zEuD9GMwP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXpWdjludkNGZzBiWW9rTlNQbm5YR3JoRmRHMWFzUEFSeExVeWg3YXlNUXAz?=
 =?utf-8?B?T0hlVXVZOUlET0lMeFhVcktGY3IwQzBqT3R0cUVMTFNwUm0vc1UvSXJoa1dp?=
 =?utf-8?B?dEtIRTJnekVpUXl3S1NseThzWVdiejlZQ2VQcEZvaXRiKzF5aXpyeC9JV3Fl?=
 =?utf-8?B?SXRMN1RVYzgyZWZOakx2YUZuNGMvWm5KejlRMEN1eFVIY2YrUXF4cStabUQv?=
 =?utf-8?B?K3JCYlo0OHQycnErb1l0cmNvYjBQK202YmpTKy9OZ28ycElhYVBjUnpuN0lG?=
 =?utf-8?B?RWR1WWE4YmJNVzUzUjYyc2pjZERhMUVRa3hSTW1adURXYVZPZEc2SjVBNHh6?=
 =?utf-8?B?U0MybkxPaWlkekgwaXZWazhWRC8rTGFTUEJCa1B3K2Y0VzJSbEZFUTRRYWdR?=
 =?utf-8?B?R1lzd3hNS0ZJS3hvSTlSNTkxMkx5bEJDRC9UbXRoUXVHOGVyUmdyR1RmUlhB?=
 =?utf-8?B?Z2VsdWR1eGFDTXREZjYyTGFaTURrRGN2aXUyM0tzUUZnYkhSa0hoWGRnTTND?=
 =?utf-8?B?Q05ac3V0QkVNdDVVamRiSGJrWEt6TXV0eG1QQlVlL0x2cnkzTUpaUjRScmxy?=
 =?utf-8?B?ZmwxbUhCZDNzOFUyVkwySDlqTHlMYjcxcldHdG4yWUh5eTBjSW05STZDVGx6?=
 =?utf-8?B?L0NrcDg2Ny9SSEFZYW1pZ204NGszSzFDL3IvekpzYXR6TkZkOVp3NEloU3Jh?=
 =?utf-8?B?dW13aHhJN1Boa09VSU5mTEkxNVBTWWtCQUtrWTZva1k4VG5CSnpUVHVBQzEy?=
 =?utf-8?B?ais3V3BGZnFGc0pOVHYxRyswdU9ZT05EanZNWmZjWW5oeTNrUnFrTWs3bTk2?=
 =?utf-8?B?TzhXb3VVZy95NlE2dWZGMGxYQTk1eVMrZGZlRXl0d0toM29SWm9YT3Qxbm5q?=
 =?utf-8?B?MW5EQ2p0amQ4SVZZSERkWVZ1L1ZyNEsvTC9wUC9ReURVMC96SmNDU3JIcTgz?=
 =?utf-8?B?QTJyNUlnV0lJaWZvRTNHMy9TRENmRWdIeEdlN2F1dGtieUF2eitHWUVDMnZV?=
 =?utf-8?B?YTdEVHk1VThuRmdRN2RtUExKMU5Kc0x0bjFrRVBNTkVhVW9ZcGxHSnZoZVBM?=
 =?utf-8?B?TVdzajhZVXZoQmxvWm9kNURrZ3N1aTBUOG5aWnRObjVLN1pvVHBtYmNDR2JN?=
 =?utf-8?B?eHJOOUJ5WnRmL1VSTHBlU3loczFkVXhpa3ZObm5CSGYyYTVkM3BWeU9FV1NQ?=
 =?utf-8?B?NmZxOFg4KzQ3VHlkSnBsVkVzb1hVa1VSSjMxZTNpY3N3dU9FNU9FSy9NdU9m?=
 =?utf-8?B?ZHRwTkNwNGNJZms0OFhGY2ptQ25ObDRuaGtNVGxObnFQMmc5dndYVGQzeDhH?=
 =?utf-8?B?dW13V0Q0T3owZThnV1gyeHdPWHRFTDFlVS9mRXFtZ1E0algzaXhqTHhXUjN5?=
 =?utf-8?B?Y1ZFVlUvMm11TUNkUEtldE10djNOOUV2QWJhWXc3eXdTbm1RQzJIWmY5cXZ1?=
 =?utf-8?B?SDIyV0tPMFF1NnVvd0dSbXQvUm40RHJQbFVIWXVlblpjR2ZzL1RqY0VjVTlq?=
 =?utf-8?B?YkM5UkVtaHNIK0oyNmZNT1pPMUdCRWo4VVQ2OFhzaWs1Uy9DelNKdWRRc1Qx?=
 =?utf-8?B?bXcyTFZPN25iUSt4YWYyRHBkV2ROallyVk5KaXNpRUZ6cDVxL0Q1dGFhdmFt?=
 =?utf-8?B?ZU1SMUpzWUkvdktGeGZlMVBtR2pFM3U1YlUzZFF5N2R0cEpSQzZvdXRSSEVr?=
 =?utf-8?B?QnBJdC9ZYzhpSWZqejlkOWVHM3FIYXZhaHhuMzhMRUNybm1jVTFGMTNqdDlj?=
 =?utf-8?B?cCtKdmIxc3I1azg5VGJHWFEwcEdERFlzbTJwTUZoRjQ1b0hJekd3UkxxRnB1?=
 =?utf-8?B?eExSZ0g0UjE0VjQveHZpRk9FRGxhUUpmMkQxLzl1K05BY0VvbFZZbENqT0ZQ?=
 =?utf-8?B?YnJDazQvQXBjZldHbEt2cUhwWHYzelVwTk1yTlN6Y2Zoc1BOeVVWSmFOV1dn?=
 =?utf-8?B?NFBURWw1U0RGdm4rZzFPNVVjSzhESGE1bVpwekkyblVhUE4ybXZzdEFUVSts?=
 =?utf-8?B?VEdidEwxTkxVL1g0UkVYajU3UVJuVlV3bURGeFNNR3JYaEdpSU9rYkFEeEdq?=
 =?utf-8?B?eW45Z3ZVVkF6NkxVR3pvQVF0emcwN1ltWUdvUXpVVEhnWnhMczdpQ0hZZlhp?=
 =?utf-8?B?RnFISEpUQXE3YVRQU25TYldlSEpNN2NKZDkzTTFFU05BZThIazRSVEVTQytV?=
 =?utf-8?B?RUN6bHYzcThoTDJZVmg4cjZIcEpYVHUvZjJBYnJ1cWI0d2dmdWtXTlovZE93?=
 =?utf-8?B?eVFrUTczR3c2YnZMU2t3czFMM1htRXIvZEcyZG1XaExnTnd4OUxiaWNGcHRj?=
 =?utf-8?B?dzNKeElwVGNyNXhrMVlFOWNkUDVVQnI3eUh3QXloVG1Pa2s3dzBsdzRiMmdu?=
 =?utf-8?Q?KLn1z2CWfdq99CIn92HUaquUvwzvfsd3GLo4y?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c112891-482c-4867-e769-08de7aa5e976
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:56:53.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlNDmtRnOM4qBhpdho7owXXwuNL/vZcydfjMyHAtJce3F8JqyQzDfENbb2JZGIyPr+eO/OdHNcplXFwYU6vfWpbaJ3XsKt+Jn1hjRgyS+hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12495
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9062

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the extlinks extension to create new roles to quickly reference a
> commit from openembedded-core, bitbake, or meta-yocto.
> 
> For example, use as: :oecore_rev:`437e0419608e`.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 5a69977cf..f3234b241 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -91,9 +91,17 @@ rst_prolog = """
>   .. |author| replace:: %s
>   """ % (project, copyright, author)
>   
> +# base url definitions
> +oe_git_baseurl = "https://git.openembedded.org/"
> +oecore_git_baseurl = f"{oe_git_baseurl}/openembedded-core"
> +bitbake_git_baseurl = f"{oe_git_baseurl}/bitbake"
> +yocto_git_baseurl = "https://git.openembedded.org/"

Well, thanks to my company's wonderful mail server this is broken but... 
this should be git.yoctoproject.org and not git.openembedded.org.

> +meta_yocto_baseurl = f"{yocto_git_baseurl}/meta-yocto"
> +

Small nitpick here, I think we should make it easier to distinguish the 
server URLs from the repo URLs.

What about something like

oe_git_server = "https://git.openembedded.org/"
oecore_git_baseurl = f"{oe_git_server}/openembedded-core"

for example?

Not sure we need _baseurl, it's kinda implied if we have oecore_git?

Cheers,
Quentin

