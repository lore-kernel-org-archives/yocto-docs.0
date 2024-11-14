Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15BAD68B32
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 15:29:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.9])
 by mx.groups.io with SMTP id smtpd.web10.39926.1731598185476791498
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 07:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OYzTsLdn;
 spf=pass (domain: cherry.de, ip: 52.101.66.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQuzsO+MnTV7E96KEBYifn9W6aSaTSrTGY63IWGEsk5jf1ZSQVtnlLE/cueYfZCMUMuPiKYEoVhgRR9N8mpZZbvlu/FYEhwcSPqUc4n8B8PWn3z3YRqmqWOssae6W5ZssfNsejX4EMc2T0dAuJ6LrCc3vgQCX1oMjtox7/4BT41LWRoH1yz5fM96tp8rzCJa4Fhu4WAbgCoXniFrWNmLoe0pxVyGSwdSACnWzbjMu0BuSYOwwt3Jg+DRcyUnWI6ZyFb6aLJgnnQyZ74hrq6t7IAqmvQZAbh64p6Gjn6ctxUzuR5gs//WsoUcsAd6/ATvDC/zVi8gTSsRulvyXgpyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP2Ubh73mSdMM1jP1OrWiNlgsiAi69g7cWL8lDCt5vo=;
 b=FmyyXgR+GZBDsYG1t5DtFSfPyuyoFk2t1OuWEjnPEd/Kc+kGMTHk7lhtA2OX+ZeUT+iqFlQ4vNXci4PV2ssQme/e/3smSXXoLaFH0e++TOE1p2OrX8Tp5qMMBTXSusQ2V4+jctsUfqYUXaMA/dTF+OoiaG5FCABZ2+f4arCQYwR4PrCez9WKzB6Zs0xFAjoCbEUgLwKPlokQmnXIiucaKPfK6VcX6ljZAOad+lpFBWnvaMQ2fHKyscBsT05JryyABiLFRqP2tId9djv/XL9HSiJUEY8FJcmIsk67YLTp4u5D4AJDMfPCYIISyf9jmk41QYRdhI0vFyvMHMZ4EWNdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP2Ubh73mSdMM1jP1OrWiNlgsiAi69g7cWL8lDCt5vo=;
 b=OYzTsLdndCwZ2gk4PwZL897s/DZK5NIQpnAYAmiv2B3ayjP/JmbCEFSGGTsTdtCOGaBUi1YAIDZtxl6ZpLcPiEXZ8F8pke+rDJVzFYR+obxMRT6RRYKDmwzcCcOECsStKgcRNRwj2WNz/ZU/yF2zW4wg8fnGSQ2s5TS6QW9zk98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10209.eurprd04.prod.outlook.com (2603:10a6:800:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 15:29:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 15:29:42 +0000
Message-ID: <b5d34c24-48c9-43c8-8891-c350a4a06b1c@cherry.de>
Date: Thu, 14 Nov 2024 16:29:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH] dev-manual: bblock: use warning block instead
 of attention
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241114-remove-attention-set-warning-v1-1-8d620e7aee40@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241114-remove-attention-set-warning-v1-1-8d620e7aee40@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10209:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c39a594-5293-4569-5338-08dd04c128bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFYyMjVBbGhsZGM1MXg4VFlSNGNpZExTUWdVMHU2ZkFod0lLY0N0Mi9vTlh5?=
 =?utf-8?B?Yi9waEd5elM5aHBkbkdXSStVaytiY2hvN1FieWNpcG5sdmZ1T1hQdW5LK2dS?=
 =?utf-8?B?cytZLzR2QUdtMHJaTG9wT3FLN0doWWcxZWk4Y2I2VnV3Z3grZnRXNVJKZVda?=
 =?utf-8?B?TU5hZ3BJdHhOeHErb1l5ZkgvWnFRcWNHSEExUVVWSXMyOU4rTEVsaEM2L2JS?=
 =?utf-8?B?NjYyNTluMzRmbUtQSE9jOHhueC95WFRPMlJVRXlVVGVPK1pWNS9rUFBwR3po?=
 =?utf-8?B?bjErT3FHYW1FSlBxUmV2bTNVQ2NGNEhNZXA1ZmZPaDZ4MVFINnM3bCsyUUZV?=
 =?utf-8?B?NnBFd0w3MDZGNnpHYms1WUtuV3ExNCtvbHd6UWdOODB6NVZwNjJwdm5uL3E1?=
 =?utf-8?B?amhjWGowNSt2WmloelBFUENKdWlvYVcyTFdpV3JTVng3d0RrRVpURW80UDVS?=
 =?utf-8?B?NERyMk1aeEdVakp6NmZaaWpSV1UyV21DaXNhUmx5SWN2WXN4SjVYaCthNkxJ?=
 =?utf-8?B?MllpTVdSYXBTWXdaUnByREhna0JwUEJKSXZ4YjNlbTV5NjQ3YVdGSFVZdE9B?=
 =?utf-8?B?RXRNMk0vUHEyaCtuSm54VU1rTTQwQndIUWlabkhKK3ZkN0pwVGIyVHg0YXRs?=
 =?utf-8?B?YzhVbHI2MlNvK0gyVlZzNEFkVC9YOGwyM3E5T1orczcyVWpPYUdWTTZYUjMr?=
 =?utf-8?B?TXNKQU15WnlwYUFmaUtFOGVIdWJyN0xlcGEzUjZzL1oyZm1oZXpoMGRwZ2ps?=
 =?utf-8?B?OG5iQ1ZRLzY2Z1ppakJiTnRTbUhaak1FRXZ4VkFidTJzazVSSnN6dUpoaGRy?=
 =?utf-8?B?cU5lMkxTeC9ZV3BmdTBqNDJSNFhkT0cwYVdtcUx2aXVmamNadFM5MDZUKzRS?=
 =?utf-8?B?OTIyWXpLeDBaR1Backs4OWdQSGJhZ0JBVDU2dEwzNlBKVVFOcWJSdnRwcUh2?=
 =?utf-8?B?MXJidmhreHhXYVc4bmxtTGNHZG9HV2JYT2p0eWNhMlRob3YwSGs0aWI3bkRK?=
 =?utf-8?B?ZGhMakY4eUczNDRVYWo0cng4bGRsS3FkZkNrT0U2ZXUvbngwcVIyWlBHWnlM?=
 =?utf-8?B?dGtVMTZtK1hYMTJqRktwTUZ5UXZGYUlWaVFzUDNTZHNYb0h2aWs2bisydjBs?=
 =?utf-8?B?TEVVVmdhL05RaEpielhnUUJnVU9lSWNPa09oTzBwNVlrMmpKbmtTVnd0dU5P?=
 =?utf-8?B?ZFozWngwdUtlWStHMWFXamk2QmNKS3FzWThlc0Z2WFNCSkEvcXJvYXpGYWRH?=
 =?utf-8?B?QkpiTHBQVE53MGtlSXJyYm5jeHFRMytRUUhMU0tCYk9qVFRhK2RIWFVkWEN4?=
 =?utf-8?B?UnBzRzltWlVub1B0NjI3VG9EYlA2amtQbHBmQnkvcFM1RDdEa2hjMURpMW54?=
 =?utf-8?B?b1E5VmVNemVxQ3kyK0lPNUVQL283Y0Q1VmlJcFBnZVR1RlFDV0ttalhZNGFE?=
 =?utf-8?B?QmNtckRrSVB5ZVNGZ3RFMEN6eUdVTzVCNTVCQ0dnTVVXUSt3UW1CTFUxT21W?=
 =?utf-8?B?OUJzNXY2eFBHVWkwcUFKV09xMGNBazh5TDd3VkNGOEg4aGp4REFuSSszM3Zx?=
 =?utf-8?B?enNtRHlzYWMzaWFremg4azlVem4vakFZWXdDOG04ZjNVUkJ1VEpqRVplZE1n?=
 =?utf-8?B?TWwwVHFUZ3BGcTZ5cWVEL2tlcURmVDJlQU5VVUpSU1B2ZlpEWU9xM0hGQmcy?=
 =?utf-8?Q?xJ+oVOhaRh833O3aRBhV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UklNV3lxb3o4LzRsL08zcTY3TElOOWhheHBGcTdhSXRmbUVOb1dEQll6QXRm?=
 =?utf-8?B?Ukw4TXFua2ZIQWtkZ2paN0hlZ2FSdlpGUE1vclMvdXpZRjc3RnY1TWJ4Mlhx?=
 =?utf-8?B?d3lkL1VmMXdMZGFzMHRzdlZnYjRCZCtxNFJRL2NmRDVGVTJsYTl2bllJZ0Nj?=
 =?utf-8?B?cFc1Nk1IVlZ2cDh2dHVxU2pUN2FWTXVDMkdUQlZaM0hCeVhSdERFd2xLbXpH?=
 =?utf-8?B?eTRqNVdyUGlFWXV4TnNGUGlWNG15MUdlK2FWYjVWOVdBWG0vQm5zZW1lN0lz?=
 =?utf-8?B?UERHTFNMRnU4Y0NRRk1taUdzNmhYRzJnRWh2RGpVV1FtcmdZQk1PUzlYRXBV?=
 =?utf-8?B?b01seXY4dlBDUDdkd2JrYWJtUGVGeEVOc3RXVEFWakdHRmpCdWF2bURsL2Rp?=
 =?utf-8?B?Z2FUblBzTENyRVlTNHNZVW04bHlRaTlLRXI3WjNRZDFnRWFMNStJeUNLVk9D?=
 =?utf-8?B?Y3JrVG9ERjlmWXJWTk02dGs1RzhnVjIxREVoeDMvcE55b25NMTF6T2NldWtq?=
 =?utf-8?B?dEZ0R3lqR1cwUEZzOEpLb1YxZVUrdGJ2QlBObjRBZ09YUWxIVU1pNFcxU3hu?=
 =?utf-8?B?a25LNlBaZkRPcFBhQnA5dm94OU5lRE1xT0Z6azVZeFY0QXBKUUkwRHlSV2VI?=
 =?utf-8?B?Yld4dlFXUkRMV0FNdWxJNWY0T3RIRlBuUTJwVVdFRWpzZFZ6WXk4TkJWL204?=
 =?utf-8?B?MHNoZXZrTElpNXY0VzlEdVNHWHhDb3orbk1WNHRXZENUTDN4Mm1Wenp1SXhN?=
 =?utf-8?B?ZXIweGdtQm12aHlISG9EWU1rWVYvMkxsd0V0VE4xeUJFT0Q5ajBJMkQrSm01?=
 =?utf-8?B?VEs1VWt4RmoyTWQ1NUY4UGxoQzd1Q3dRRFluNWRnNXhGcjFLaWFWRWZ3NitZ?=
 =?utf-8?B?SFdBTGZPRzNMclpyQ1A2QjdVZWwxVEZNWnlBRUJpeitFUEIxRE1JUXhsREhk?=
 =?utf-8?B?TjFpNWxSdUhoUkRpRFJYL2ZoNDcrTXJaeDRhdVltTW53MzdZZ3lRUks3dUVw?=
 =?utf-8?B?bnBIdDFTcHF3bFd6VU5nNVhIMzVMRFRZaTBrMFFsVUJyaVJaeHlkRGMrWGF3?=
 =?utf-8?B?NG1DbFY2MjA0Y0Y2R2lwcVQzMkx1bkRJc0FWMnQxcWFsWEo1OG9aaFQwS2g4?=
 =?utf-8?B?Mk0rUFJqNVVza1l3RlVVejRvc254djRUbWtndkIrRFpVdnNoVWR6LzRkbzBz?=
 =?utf-8?B?QVU4eDBhU2JxbVFUdTBXc0hQUjNoSG9BVU85VlhtZXFHOVpmUk9nTG5NbFpO?=
 =?utf-8?B?N1gyUDRsL0lrQ1VLRTN0SDIxVDFDSUZQa1c1Mit1N0xaUkNuOXFTaG5DOU50?=
 =?utf-8?B?bWdjc2ZHQnJ5d0pTZ1NFaTU2MUdTaktsa2RSSXQxdHVDTGNQWm50S1RnV3Mw?=
 =?utf-8?B?MFFnbDd0SGVNdE84YzYzeFNwaTdvem9oZ2xFckhqc3J5enc5KzhXRjkwM0w4?=
 =?utf-8?B?SHl1andoMzNEMXBMeDJXTWpFYjNYMXZnSkpzK0xFT01ubGlab05BdTRBL3V4?=
 =?utf-8?B?d0Zmd2tkbnFMQmdQNk5uWG15d3BqaFRIblVET09mU0lEK1N6WXhlR2xob2sy?=
 =?utf-8?B?UWNFTm5CRGxlRHRvUS9HMnhRT0kwN0JEc01ORWtsQk10SDNCWXRoTEZyQlRV?=
 =?utf-8?B?MnczdjRycC9mT01Jd09vTFIwM1NqQTNieUVSQWQxSnNlaC9JRTcrTm12cmdo?=
 =?utf-8?B?TVNqQytlU21pdGJyajdhVVNUUzBnUnF0NnZ6azRRNDBSN040M2VsdTFZN0RW?=
 =?utf-8?B?SnFLN2k2THRNbHRrZjliZHNQSWV4Z2dldWdUMDhlS0dzeGF4cWxQMWZUbjVj?=
 =?utf-8?B?eDdobmU2U09BUEZQNzNjdjArSVUwNEJ2QjlnRnJsc0lINmgvbjU5SDM5THRn?=
 =?utf-8?B?RVRZcTdvN2VBQ2ZmL1Q2TVVvTXpTckNRL01aTzEzNDRQUm9iNXE4SXVsYWhp?=
 =?utf-8?B?OHlsamkwdWtBdWw2UG1sT3BmaStGcHEyS3owa1E1Q0I0ZXkrN3c5SS9LbE12?=
 =?utf-8?B?NXlJZVJFZy83NU1MdHluR014ZmVzUTlPeXZhUXF6dWxlem83UmtPTm4vUVhy?=
 =?utf-8?B?UldZU1pnOHZGR3AzaFlTQWxSNEV4bHpMSm9CUG9tNXAzdXBrbEdqZGwyM0Z6?=
 =?utf-8?B?alJLNDVNQ2l3STJuMFBGaWMyMGlObnlBd2JyRmxsYzlSU1VMZEViYzNQT0V2?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c39a594-5293-4569-5338-08dd04c128bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:29:41.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDO/MUVNm/i3j08A9T/GhuvByFLGFRkN6fRIaUiO4PtaA5Tr7FlvcazFCYCOyNOA/oNwrXVDdXPujHw7e1vm0RRZOkaGvxa2USacnC2ERmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10209
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Nov 2024 15:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5744

Hi Antonin,

On 11/14/24 4:02 PM, Antonin Godard wrote:
> Sphinx recommends using warning and note here:
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I guess we could have had a commit with more changes in it. Except if 
your plan is to backport some to earlier releases maybe (since bblock 
isn't documented/supported in earlier releases)?

I think it'd be nice also to add this to the standard.md file we have so 
that people who take the time to read it would know to use these two 
only going forward?

Thanks!
Quentin

