Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D5D16254
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:27:36 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.56])
 by mx.groups.io with SMTP id smtpd.web10.53772.1728908850772311313
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dX5PFbvN;
 spf=pass (domain: cherry.de, ip: 40.107.241.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e113cr51guJ7xzoji1eJn3nbqofBY3PNPQD8Rg8kh5uo9G3Cpj6NnMwfdSMrNAUVR8TBGpZYKBHiqZSY8nIhvN8NlpI5szusRvQfFWIqhVtwo749B7vgjIypm9mASf5gjkRbPZBbJpOSbF/Xv3aVoc6Oh9eY38CDDjnBAR6dtDNHSagJVyuU6d7DTkj/lYCRla7RIIN9CD0HPbhkgZtxa4KssdE2ZPZ33ima5NSlS0hFqF+tPYoI1pfnV1F3Y/NyzcQ5fH9nuQLO8tFUA4itsH4YSaxR39sk/iTFdTe7nbkoZAKLliCnK8wmUNcDBf986B0rthl3UqQgr50BgwdemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YviYx3DvvkExzdzmoer1fS2IqO5ECzpvpTUjyXsk1x4=;
 b=I+gdv1vvn/cnZB0WPysPd9QkWvgETUbAkI8UxqbUy9Rvcfq/O5zUQ8mgfEfhA3vlw4KKl7z1YlzT6H9OkjikKv8VJ8uNwPtbtvOASvy7sH8dYH5unAPFHhRged3Ls/Nto005m1wB90lRhnsZo511KZECM9mE3laz/mMzJB2FhoR8EyyecRkpCoXHlVkajeywXbc7U+SXBktmMwDdanV2kHa/HMd7Jh7kDh2yVKQZvzhaRcHKHn08DbKs6HKMhT2MjrT+RfP5XmDADH0r8sIgqloPg1vNK8vpxgRGc57Cnqi8+6xBMH97QD2s8UCBU9OIlWksfx7dcbdi9VIePaVCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YviYx3DvvkExzdzmoer1fS2IqO5ECzpvpTUjyXsk1x4=;
 b=dX5PFbvNy38QAQmyWPpvDPLQN+5DGzGqnIqYd7pSLD1zIbB4ioaqAfgv8Vh6SPsCNVix6cl2LTHKx6/0pjzGgd67OH9ZpTC/wv6qa1H9enngXPGebtR5U+Nh51ekgMAvSG2lHyIy1Jiwb4gQlhIyA4mev3qw7Lc4zIBDf8oTQ6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9830.eurprd04.prod.outlook.com (2603:10a6:150:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 12:27:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:27:24 +0000
Message-ID: <6aa1c0d3-e86a-405f-81af-2c68f3023bd2@cherry.de>
Date: Mon, 14 Oct 2024 14:27:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 16/16] release-notes-5.1: update release note
 for styhead
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>,
 Paul Eggleton <paul.eggleton@microsoft.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Chee Yang <chee.yang.lee@intel.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
 <20241010-release-note-5-1-v3-16-2cef1a58f1ab@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241010-release-note-5-1-v3-16-2cef1a58f1ab@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1505c454-a5d3-4cdc-37d9-08dcec4b8f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ME9MTmx0M0t3MkpscUpsYUZKYVVLdy84SkRpQXRLT05Tdk9kYzJqWWhRL0k3?=
 =?utf-8?B?T1l5SFNyZk5NUGNnR2JlU3Y4RmtYbTZqT3JsOWIwZTQzRW1mbWlJZ011WndW?=
 =?utf-8?B?SFFqMEo0eEtRL2JSQVZIZ3AzZjZ5cVRoQUJCdGNSUkFKZkM5TDVXNU9JZ0pk?=
 =?utf-8?B?VUtpQnUxK1I1R213Q1VBcnZKVXhTdU9QK01wY05EVkUyaU5NVS9pSm1KVHIz?=
 =?utf-8?B?RENnR0hZa29oU0dRRkdaWlFOa1BSYTNydHF1NVh6NTRyMHpuMExkRDZNSXhx?=
 =?utf-8?B?VUJYZmlhZ3RzNUl4UzJIbGFzODZKUnJxcDkzaE9NM1p2NWZMeTNFRi9QY2Nw?=
 =?utf-8?B?Nnc0SHE2RTQyakJJS0RFczNnYjBlYjdyR1hXNHVrak5YNUJLWkN1SVYveXl0?=
 =?utf-8?B?QjZUbk1LVi9DYVFZc2lweTBuUTVPKzJDb1BNRkdhWHV1bzhuakprbnZ5dzBr?=
 =?utf-8?B?SmlUTHJjNVlYM0hlV0tPRzVSUmZCdEo0ZmZaL0Evayt2YTBOa1VVcU5tSXdy?=
 =?utf-8?B?RENCZm05Y0p5L2traWV5KzZmSXFBS25hdXBUbGw3ZzRyZzlLK281VHVwOGJq?=
 =?utf-8?B?R0dKK0dON2pKMXZibDU4U1lXL1BrR1BaM3lRNk9HbkpOSHZaSDNvaVh5N2Q5?=
 =?utf-8?B?MUg0UkJHTnFtTXRJRy8zMjhGeExwKzk3MExWVUx5MmV0ejR5anVHWnlPbFlI?=
 =?utf-8?B?UVg3RUREaEozL1QwRWxWNEoxcWRUZ0FQTXBITWRPVGJEMHNEdVRUV21jWFhp?=
 =?utf-8?B?Zmpyby9Mb25sK3VPT3UyYTJDRjRiYlFiUWFiNjBncjlZYVltc0VDYS95Lzl5?=
 =?utf-8?B?em12R0RXWGRJTUNFQ0dqbTErSUpGSUpvNEdweHpoM3VXY3ZSaDhxZWVLSHVz?=
 =?utf-8?B?cDFBYWNzT01nVUZhUEJ0c1ltSVNHM01ONHBqR2JWaHZYYnBybjV3dUxiRS90?=
 =?utf-8?B?cjQ2Tmt2ZnVQYkIyS255WjZEb0ZpRjNhRXZ3MXgzUysvWUJGeGwwcThQbHZQ?=
 =?utf-8?B?YTAwOHh6eW16bmFRZTVCVHYxSnJwNzR4NWU0eGw4TWdFRGhFQ0htR1V1VkU4?=
 =?utf-8?B?ZkM4ejY2WTJEMkRzRERFeFdTdUhRWGZzbmdoUktqYTN4VlBuanV5ODNVQ3Vp?=
 =?utf-8?B?L3lwNEltckM1V2x3Wk41bnJEOWFsRlZHckRsZ0pkWHhDMWRmSFl2Sk9QY2ZY?=
 =?utf-8?B?Yk82VW9hcjV0Tk1XYnlSdmIvcGpGcVJMUjZ0Y3hDTXY0cVA5WlkzREFSUFAw?=
 =?utf-8?B?SWZvQW1mNnRDUnpKcFVUNWFVaGwzdndwYkkzRC9iejNWc2x0blJnbVFscjk5?=
 =?utf-8?B?NGVHRVY0bHZkZWU1Z0dVbms1OVIyTXBMZ2JLQWhQNlBSWFRtS2lzK3E2VHdm?=
 =?utf-8?B?NWZNNll0ci8xSlZnSTY0UDJwWHRZZWFOM094OU9XR011VlpOc1ZMRG9WOXBQ?=
 =?utf-8?B?MXFIQUxhNm1vNkk0OEtTemNNOFBteit5a1lpTkd1QU1VeGZyc21IM3pibmJT?=
 =?utf-8?B?YTNlVnJiRXd0dllJSHB4c3dmRUhmUTZsbUQ0UFRaakFIalBBZmpCcldwbUtE?=
 =?utf-8?B?N1l3V0tMa3hLSDdXOVFDalVwYlZxamU0b1M1Q1gxeUZhQW9qUjlQQjA0VUp3?=
 =?utf-8?Q?RVGYoQfrjUFDrtgxM2SHAoCGXXi6jiJm3DYPuySZnGEI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1BFN0NyemNIOTcyYUV0c1ZCYnI4S2t4KzFIei9CaHJMWTJ4Skxjc3IzWExr?=
 =?utf-8?B?M2VGdmxNZCsvTjRBaXRkZ085YjhNWEpXRFlaS1JuK2VmNG90TXJybXB0MlFR?=
 =?utf-8?B?TFJjbGRySWw2d1pHalowYTNhMGFEcWd1Znh2VVJqRnN1RzhYRTFBZno2Q2d2?=
 =?utf-8?B?MlJvN3NTL3BNVUxGRDF2VExxdU82OEdOM0pSYlhaYlJORU5oSWpoMFExNG5T?=
 =?utf-8?B?UFRNUGZCeUtlQkhOY0lqRW9KckV1b29LcThPWC9LVmtoOU9jYmFjT3hKSTQ5?=
 =?utf-8?B?bjdHU0ZrUE45MXc2RXh3QXhFMU5uaTBOZEhYNXFFbG1jalh2UFhOT1RyTE00?=
 =?utf-8?B?VUtrTStqSzNmQUVBcmZpeDZRc0lvNS9UTmNYMi9SNDJURzJnR0lLa2tyWXNu?=
 =?utf-8?B?T2dZcHdDcndmbUxVbHhQaDBhdytPYUYrTk05R3BPcWtuMXliN1Y0U1FlR2Jh?=
 =?utf-8?B?T3RFUkozc0JXbmtVV3JWZk1jR090UkNwU1NwT3pwd2hZVUNaL3k4UTg3OTNY?=
 =?utf-8?B?UnJHMkVKLzd3eTFrUWlRT3I2UHYxTjFJNkNRV3NSWkVxSzZUbjhBdXpSRkpT?=
 =?utf-8?B?UnNuOUMwUWxoM1A4QzdOYXMrUzA2Mnp1cXlySW41UEtQTW9oeW1PSjExM3Y3?=
 =?utf-8?B?S2tEbFpwYTRwaGdIMzBWS2FKZGVqQTFMVGdDQzE1b05JTW9WeWVWTy9zblg1?=
 =?utf-8?B?ZXYvdXNpeVB4OGlReWlqWllxd1BsVUxVYTBsWi93NVRBN0NZTVlpVDI5UHFr?=
 =?utf-8?B?dStNODBFdzJGb2syV29STVZCc3oyK2lYUS9YcmlaY3NQRTFRUVZ6YUJSdnBG?=
 =?utf-8?B?SWtkSXNsWklWRjMyL3VFSkhoYXk5bXp2ZjVWWGxKUUN6MXJsQWhWMWFMelBD?=
 =?utf-8?B?M2RjeFNucHNVeitrVDg1aVQzbzBXK3J2dSsxOGFsTGozbFJFdkgwem45OWJB?=
 =?utf-8?B?OUNWUStlb0NqUktxNEpFcE1KWkNiZkdKQnZkNS9CejR0V0FOQktMU2pWTTNF?=
 =?utf-8?B?cHk5bjFtZDd1WDZCOUo4MkljNmx4VU5CYXZzdDZvNDNnQWl6Tzl3Y3d1UHlB?=
 =?utf-8?B?aFVwb2VJYkJ0RkE0Wi9jd1VqMERTUWd0NlNjM2lJb0luTWpMUVVEMi9BRkQ0?=
 =?utf-8?B?MGg1NjZEL211WWowdS9LWmZ6RWJPS3lKNVg5Q0V6TW5CT0RuY0JsQjhpSzhX?=
 =?utf-8?B?Sld2OHpYWS8rN0pMOEZkQ1hQTGJuRDF3eXJnYjZDY1d5UkQxRUxPMWJPbzdS?=
 =?utf-8?B?TzVzL1pmbFl1KzRLUk9vbEw2WU9Pa0NwUkxwTG10bGpJL2FtUUIybG1QaDhB?=
 =?utf-8?B?S1lLVUZyb25yeU9Gc3I1Nm9UcmZTZFB6dkplaXI2a1pNU0VTeEJDM3B4dElu?=
 =?utf-8?B?Y3RmUUF5NnlESkh3UFlqYWkyRVZHVkVjeDRGRGk5Y2ZQMFBrUEl2dERjbFdp?=
 =?utf-8?B?MkhidDVvOEl1RlRFalArK09lcFpMRWVtekh3a1dJNEhITDMrY1o1TE1peWRF?=
 =?utf-8?B?dGFpYmlXOWdhMEgwTDIyS2h2NHJlK1E5emhPcjdybEdGZ1M2WFRJQmFlaDVE?=
 =?utf-8?B?TTQwUldoQk8wanNKWWN5UEc3alpmYUtaeUpvcGw4ZVhGYW9xV21tQnJGMWdl?=
 =?utf-8?B?QXprYmo4Wk5aUlh1by9GUEFIbnRqa3NmVENOZG13T3BQT0NXb2RLWXAzT0FV?=
 =?utf-8?B?L3RDL0RRNEZjb0VuaWNwZWVxazBBcnZPbVcwRDhMRE13MUJJQU0yamF3MC83?=
 =?utf-8?B?TE5LRjUrblFOR2JoVTVqR2ZRdEhCd0hLZU1ua2lQYUZwdUNvQlFtcVhqLzgr?=
 =?utf-8?B?K1JDOTdmNEtaY2NDdE9BL3J4enpsenhPZ0wzMmNYdWlHMk9QMCs4UHFRcDFj?=
 =?utf-8?B?VkthbURNZ2J1SEVpdW9YUUZvS1Fzc3EyVXgvcm9kRGVVZ2dCMm43bFR6NmlC?=
 =?utf-8?B?VVpRUkFRWjRoVDh5VGdYbDR0RzRKT3djNDAwTmlpYTEybk1KTDViTWIwR085?=
 =?utf-8?B?TEJSMHJLRis1M3VQcmw2czkvQks3dzRMTUtvSGVKNGM5N05DUm43bGgycDNU?=
 =?utf-8?B?RHUzaC9DakIvQk1NL3NjOVppbjUxYlB5dWhyM1Y5d2pqUnp3WkNXU3plVWg0?=
 =?utf-8?Q?kPElnsN0oyvN6pN85oW2FTfT1?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1505c454-a5d3-4cdc-37d9-08dcec4b8f0d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:27:24.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBMH16QuAkeOI2Hu3eVOS1jTYCo2+jgR2LBf0czv3WT32RA4Nyj5P6vvLA8jasWsTjOlY1E8HGUbzeypWDaau/uNskJWuaM7G8od6pGqXaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9830
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 12:27:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5481

Hi Antonin, Lee Chee Yang,

On 10/10/24 2:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>

[...]

> +-  wic Image Creator changes:
> +
> +   -  Add the ``truncate`` utility in :term:`HOSTTOOLS`, needed by some wic
> +      commands.
> +

I think we should add the package that installs `truncate` to the 
required host tools in documentation/poky.yaml.in?

https://pkgs.org/search/?q=truncate&on=files should help figuring out 
the required packages for each distro. I assume it may already been 
pulled in by other packages as a dependency, but better have it 
explicitly listed than relying on a dependency?

[...]

> +SPDX-related changes:

I think this is missing `- ` to make this a list item?

Cheers,
Quentin

