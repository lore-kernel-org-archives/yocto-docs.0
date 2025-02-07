Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51456C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:26:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web11.65608.1738920386145105236
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OOBp/9v+;
 spf=pass (domain: cherry.de, ip: 40.107.21.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsiiY40mVFMj8SjBIVFLvxtsHm31Q4HygOTYPlD8iu8ilACVPJYJAfkBZsR0fBWt1uzsNpaurXRyfhlqEgf1AuDIaLtKtRbGi782amjUWeSRWt+nXLRJJJ7uE+doB1fGkjIerovNmXgfFLsFJxGwQHOrJTVyZtqriB1yZCimcWxHSR5nqcxhjO+EUgMVSbmpO0WsgwpQtwo0Cz4z2LRQBHy+auB9FXHt74BIWKivA3Jcca18CFE9wdoQ9oyeb+Qxc5baCYzG3OQs0dKti0ZEU5ck0mPKpY4i475foC5CCPOdq2t1GtrJzf/1icDPo2Ud4f6ycG30Sw4ahFYN89/Jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlT/SlOzmu2YmQ0I+lpanYYwkBRuWqMb9S5VakXI9oA=;
 b=DJywMcD9whVpr9H25AuwxMp0z+dxpPnaTRik5SC1gda4cZIsm4AoHLd61gR6j/jjC1GaleK9nd2KP24CGlQycoZNW/csACQT/iukYnUjZ1Y0WDopFS3cUFxiIK5XsJWIqMd1b01EzvyQYe04mZ+gXqLFnxWtMquHTAfOFW+EeAdMJLwuNSxpHBJkY3sui1fEIOPECpqdSXXSxFZg8wxLrK9t38+5OgOWViro/C/gKo1t3aZAcDHUPh5C3APcc/Pad6qNLGJIXR4x8OeZlisFLsyuWX9K3fSszcd/lqMdrRItZA4DYnIbnlWP7vFdMEYYQ0fOKbDoNmqXLLWtx2Gung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlT/SlOzmu2YmQ0I+lpanYYwkBRuWqMb9S5VakXI9oA=;
 b=OOBp/9v+NNfGuY4w3wIOn8r3MDKXOsN1QN4NArLYWsJDzcomz/aT5cCxxLn04UjX2qQ8Tk6gtQukW3bir1C6rA5eVkXcKAhdH0gkbiATPnWGyXzqE7q67+jbxXiBuDoZyPAb8cUh9Jv2xwD4KuYzJ6usEyp2uzsJvjfMKfPgETg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 09:26:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 09:26:22 +0000
Message-ID: <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
Date: Fri, 7 Feb 2025 10:26:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] add basic b4 config file
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e881d1f-8cf6-46e0-de6c-08dd47597c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHl0T3FoVEJaQTY2VlIzQVRCVDhPWDJVWk5XK29IM0VWNEZEMmg0SUl4RXRR?=
 =?utf-8?B?QW9QblpXMUNWS3ZkMmE0QnBtRjV1RXowKzNkUTQ4NTZzWXpmMXJ3THRUV0pJ?=
 =?utf-8?B?cFZjd0RwOWhBMmlqOFhmYmt1bUVPeW9MVmhsRWlPWUhGRjNGNTQwenVkbzVX?=
 =?utf-8?B?RFMxZ1BJK3VPd04wZUtoU0Vobzc5SDJ6NHY5WFltSHhMeEhudS9DL2wvNkQ4?=
 =?utf-8?B?OGZsZWhBQlZhNlplU1diNHkwMUZTcWpqc2FXOGNiODFabldSMEFtajB2Szkx?=
 =?utf-8?B?MzlwZE9mVG1pRWIreCt6RW1LUHRnWmErL05vVHBCYVNja0JsZUU3VDVXWUp0?=
 =?utf-8?B?TjUzZjYzT1ZCZm5DWXJtR0ZwZXMwVXB4MHBiTTZQL2xnR1lSdWxUMXROci9U?=
 =?utf-8?B?MDlMbmVHL0dLMEszV0ZsRlNwVGdxSWxJazhaRVlxNHAvMUpNV3pmQ1MrUjli?=
 =?utf-8?B?dkVCWldiQmFTR2o0Qll0ckg2ZnJzTzBuSUpVbUhBSXlNaXdWOGJtS1QwblNq?=
 =?utf-8?B?ZVhKMFBBYkF0S0xJUVd5TjVneXNDbDE4Zk1JZ3BIaE8vZG5hbTQwK2o2Z2ta?=
 =?utf-8?B?V1FxQS9SdjdWY28xTE9vV1ZTVEJ4YTNQcjJaS1QxU2RLRzZwMDI0RVVadC9w?=
 =?utf-8?B?RTkvU3B2czJzQkt4a2MweENSa1FCNko1cTQvd0hob2xYeFNHTXJ2eXE4cmY3?=
 =?utf-8?B?NFp1L1M4dmRNZXpadlRHMVBvZE9NNGU5OHNYMHBpMDN3V0tyTEwzM01hWG9p?=
 =?utf-8?B?WHptV2RpQnFad2hvSUNBNktJQk84U0Vpd3JGYndCcG9ZOFdoOGZwYVlFV1hp?=
 =?utf-8?B?R1lmdCs2ckFoeTdrZ0hHcnVnNFF6MUR4eGUwS0tMMlc2TnM2QnNEQm5RaWFI?=
 =?utf-8?B?Q1NCQ1ppMHJyc1BQTVRZK1A4Z0lPWXF6dU10Zmo1YWRHVXcxTTRuU1grdUpL?=
 =?utf-8?B?NmJXcmRGSDRhdFc2aHA2Z053YTQzMmhjajFuZGkwakI2citsMUM4ZHh4T1pl?=
 =?utf-8?B?QU1ab2VlUUFocEpMNW5aR202czJJckgybDh3VG1GVHo1aHN6RllrRGZVb3JW?=
 =?utf-8?B?OUt0WGl0elE1SW9iWUVZZHFmdm5sM245RTRHVUlwZWVIbmdqazhWeW0wOG5E?=
 =?utf-8?B?MDRIQUJuVStXVi9jcUN4Q3g1Tm9MR1kwYVFZZW1vSWRMdzA2aGxRQ3dHRUdE?=
 =?utf-8?B?cGxwV05wNmYrSm5aY1NEZkY1UURLUXQ5WDkrcW9DbEovSHdyRmdZSEF3MGlL?=
 =?utf-8?B?clptK3B2V0VGU09ESTlzTVpHa1dDMjhBdWpLN1Z4VDI2Qml4dStXenhZem5D?=
 =?utf-8?B?aXhvYVErN2w5VVNFTXdJUjQ5N29seHdjUmtLL21GTkZULzJNUEJnUXpZU1Vn?=
 =?utf-8?B?aWNSQ2hkYlBFRlJUN2VQbStJZkRJcEhXcUZKTm10bndvTWF4WDZrN1RQaEt3?=
 =?utf-8?B?N08xL1hsL2U4WkpoTjRjMkxCQTdMWGljTExPZXRWclg0ZmVheGNqTDYxRFdB?=
 =?utf-8?B?MHh0aUQzQmVWbVRJYmI3Ulc2SzZpdGtxUzJXUyttV2ZkRDAxOERFdmY3TGZ2?=
 =?utf-8?B?RGJqbGRpTFRSMXc2amUzOUxvY1lnSVdrYTVKOUdreThScXJaOVdJOXhyam82?=
 =?utf-8?B?ZWFpSHZjRHhQcGhDRDdkRzFlMjh3UzFESUZMUGo0SkVlajlVOExmTWpqQUY1?=
 =?utf-8?B?NTRwTkh6V0k0NG9BWlV3eW9jbnZGM1oxcHRQQ1JsL2pSY2M0YjN0Tm15U0Vi?=
 =?utf-8?B?VWlhYVdTZVU5ODI2dW4zSkVYK1FKVlY3emM2cUVpamZBeCtKSmJaL3ZCcG5z?=
 =?utf-8?B?YTErTTUyNmhteWN5WVBrQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlE3S28rU0lVbW9NRXZkSWd2Unl3a1pRSGhjZTdsaCtqUjZPOTJNWHpLaGF0?=
 =?utf-8?B?all0Z2hRNmYxN2tjbFkxaGQ5MURxUHNGRW1VY2dPWFMxTXU0Q1NaWllvdi9h?=
 =?utf-8?B?KzZJZ210YytnbS85RGtNdk05TzJVMVpzT1FWb1NyTTY0OExORVVBNmdxNW44?=
 =?utf-8?B?aFpHSVNXV2RrTCtjZFl1L25VY0ZnQUovMHBKQ2NVUFBjcnZTYnIxU3pGNFd4?=
 =?utf-8?B?ZVV5TGdvTHFXa2VGMnNXUXRWbVNEdkoyeDZPaEorclZEQmxjNW1rdXlzZkxl?=
 =?utf-8?B?cFBpa0sxUzR2UWgvMmtTSFY2K2lGLzNWenViZ2pNdXlGUjcxMEF5THhZc1p0?=
 =?utf-8?B?ZnY5bHdvQ2FLd2g4QlhhcXBkMlZKeDV2eVVzVHdkaFZNV0xjanZTZ1NadGla?=
 =?utf-8?B?aE9sOUJZSFpvdGw0NXJQeS9GbXpvVXpRVVNYM3RpRHBWQkhwSFZJcmNraTlS?=
 =?utf-8?B?WTYzdHljSnhEVGtrcFg2eCsxWkpqeldjSXVQbEc0QWtGRXZBelgzWWVxMjIy?=
 =?utf-8?B?VkFyZnNNQ0FmdjVPYnFKU0dGR3U4cUVoM0hLZGR0clFYbDdEU0pDT3hUT1dH?=
 =?utf-8?B?d0w1c2ovUStYUjdBTk1NZFFuUFlXK0hBZGRTN1lOYlhybkRNOW15M0R6aE53?=
 =?utf-8?B?eVdBVkRxNmhReGI1VXh0T2Z1ZGtaU2hjQmdNbzNMbC9JUVI2UGxBYzhwbitG?=
 =?utf-8?B?TG9rWWUvZWp3OGxZN21qSkpVc1NZUXhjRWFsU2djSTloOENpYnZISS9rRkNm?=
 =?utf-8?B?MVR6QVRCL1JpNmRrRmRpcS9ncVNDL3NhS2xzaWs2d0t5Mm5YZlpHZlNSTmFU?=
 =?utf-8?B?YmNNcVhlZytLdXUvV0dtY1BjaUNQNW9qaU1kREJXN0ZDcXM4Rmszb1BRdGxX?=
 =?utf-8?B?R2JCREppUDQ4OXJySElOazdXMTQ3YS80MCs0UUNnU253dHk0bHZ3RFhJMWJ2?=
 =?utf-8?B?V016bFpudTdyUGl1S3FxNU92d3F1ZmQzR2wreDBVaHVuYlFtUGFwY3FhQmZa?=
 =?utf-8?B?NWt2dlYvU3V1ZHRoT3RtTlJsSXpNQ1M3MjFmR0Y3WExYZk9CL2U5Ykl6TTVv?=
 =?utf-8?B?SkJVK294eUw5VW1YVmFmaVhpN3MvMmxLODcrblVrWG1sUGFTTlN2SmJ0YS94?=
 =?utf-8?B?L20wdS9WZjFmTURjYk5vZm9FZjFrRnpvbElIUmMzK0RkN25kMUFvZjZVRGhr?=
 =?utf-8?B?cHVxd1B6ZUErN0hPMlAxUkpMMFhtUmh3UlY0T3dQTjFYdWVrbEdRa04yQ003?=
 =?utf-8?B?SXdnNmlFaDVxVXJzUjQwL0pIWkoxbk5wQnU4UlNvTzdFMzdQdFRuTUNoSElR?=
 =?utf-8?B?NnNtZW9XYVVRcStpQlMyY29OTWxFRUJYSkkycjJlb1lwSDd2RnBkYmZkMzB6?=
 =?utf-8?B?N3g4c2liWnVQTVFEZXQyU0Q4cnYvajl5eVNjV3kzQlAzdWdsQ2lPd1NKSkdY?=
 =?utf-8?B?WVhQeHlieHV0L3RPUWR2b3RHM25mZHVBc2xjc05XVU9YTWdmU2xMdlBzaGUr?=
 =?utf-8?B?RENZaTNrVVRxSmRIZHZKdDhEdUc3RnNOV284VGZlS2pMdnczODlGZkF5Rzh5?=
 =?utf-8?B?V09HeWh5QVJaRUwwK1BvR014eFJXSXY1RGt5MWtEWWRxWVd0YTdSeHZkeC9K?=
 =?utf-8?B?QXZ2ZmxDdFhzYUwxNGlWVlQ0OWc3RDNQK2ZOdFlqNWlDQU8vWnAvQVRVTmZo?=
 =?utf-8?B?dEYwYkJCZXIwZVMwMmM1UXdCeTdtTUpDSnR6Rk1KbWUvQnMrb3ZoWXVBNjRV?=
 =?utf-8?B?cS9WUW9oeXBtOHAzejRuUXBKZHdkby9uNi9tOUR4eElLMCtCZVF3MEx2bktT?=
 =?utf-8?B?dE1ZWUNPeXhxUk9YUC9XQU9tKzg3WVVCc2FRT1BSYmsybzFWNnJneFY2Z3B4?=
 =?utf-8?B?VTlPQ3JlN0c0VlZ1SEZSTi9raGdHd1R5WnRSWnlmZVNiK01kWlU3aDlITmpK?=
 =?utf-8?B?Rm96OHpwdXVUNU1zNURWNHpEbk1vUWxXem02dzNlendHdkdtUysxYkdCRVNt?=
 =?utf-8?B?RkI3VmV2OHBLVmxQaUFiR1VWSk9MUnh5Q1NFZVp1Y0R6RkZjV1FNQ3NJVFh3?=
 =?utf-8?B?V1hOSktLQmk2d0Z4V21oTUxlSFNjdkkxSVFhWDRSYW4vRTBjSW96RTRkTEZz?=
 =?utf-8?B?QnIxN1REL05BK3NOelkzbi9aTzFkaUJuRkE1dFcvT1k3V21MbUtuakZYUWlm?=
 =?utf-8?Q?Iq7+TnQEalehC6sDA034XPM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e881d1f-8cf6-46e0-de6c-08dd47597c49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:26:22.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyx1YluR9BqMkWzm2LvYKYS479cG/FOr3tOWw45tpXFAsjFZvINwG08b1xEr4J+upxQdgOHjR2qNWQowo+y959hmuS00GPS3MnTNkWVIMpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:26:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6286

Hi Antonin,

On 2/7/25 10:09 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Wed Feb 5, 2025 at 3:02 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> b4[1] is a very nice tool for mail-based contribution. A config[2] file
>> exists to set up a few defaults. We can use it to set the To recipients
>> to always add, in our case the mailing list.
>>
>> Because we do not have anything to check for now, disable needs-checking
>> so patches can be sent without running b4 prep --check.
>>
>> Because we do not have any auto-to-cc support (and the implicit one
>> using scripts/get_maintainer.pl cannot work for us), also disable
>> needs-auto-to-cc so patches can be sent without running b4 prep
>> --auto-to-cc.
>>
>> [1] https://pypi.org/project/b4/
>> [2] https://b4.docs.kernel.org/en/latest/config.html
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> I'm wondering if we couldn't add some per-patch check as well, checking
>> that the documentation builds for each for example. Could be added in a
>> later patch though. Any idea?
> 
> I think this is a good idea although I think it would make more sense to build
> the tip commit only, as doc builds are a bit long? Don't know if this is

Ideally individual patches shouldn't break builds so that bisectability 
is guaranteed.

At the same time, prep-perpatch-check-cmd currently runs sequentially 
and Sphinx caches stuff between builds... so probably the first run 
would be the longest and subsequent ones would benefit from the cache 
(if we reuse the build output from previous patches).

> possible with b4, though.
> 

Not yet, see 
https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py#n1683

Konstantin is typically the only one really working on that, so I'm sure 
he would appreciate some patches :)

At the same time, I've done some shady stuff with b4 for poky where I 
check (rather **guess**) if the current patch is the last patch in a 
series. c.f. 
https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-poky.py#n44

> In any case we might also use your container scripts for this (which I will get
> to soon hopefully!).
> 

That itself may be adding a lot of time to the test since we need to 
compile the container first. Additionally, remember that absolutely NO 
message should be output to stdout or stderr by the script otherwise the 
check is understood as a fail. I'm wondering if we couldn't add support 
for a PIPE between b4 and the scripts so that we can ask it to print 
stuff (e.g. "please be patient, this may take a while" and maybe even 
print some progress). For example, I briefly added some WIP support for 
patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time 
before returning something, not very user-friendly :/

Cheers,
Quentin

