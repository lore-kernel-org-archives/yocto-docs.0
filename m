Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBB0ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 13:55:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web09.24856.1662386139611646186
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 06:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=eIiIZCPj;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF+8dmYodiGYrZda/gf2o/Uogu4J3SDRAcSv/HaECGAPSsDnPBO5D0b/0OlmIqg7yVmiH3LjpuXPGt0Xsy7v8gYkwWUFC3aJCz9+sSlCwDVAjVvPa4rxNvj5lLWTquB4ovkaWRw/ZxxOK9qsHzUtMgAcIeJ098LWk7xV6vQmHEIcYNp1awqCiIFzDmxW+vJRYKqRybJCSBm1tE0aZFEK35Zm9TAhzE2ULbFgwQM8MXp7ndYSnqrtfC2qPSjpUihXlxR9Zc34It9AzPuSQgDmkijn37Hfmvs2IA8UD7JtUqBXKUidflLasAdxMuOJFlsKRW/dc1sPVnI18oLsAehr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuEGd+2txkPqtHddMYGTNSzHiiaqyDdOg2BPWJfbT7k=;
 b=Ojaq4AdyfCp2c7NadSzVP1KM89Uz0FfvbHDC/Rc9GjHa4kKjjx31sBcH8kbRWOdI7r2/cQyYh5a7AqcOJICZG0SfCWn6luEjEZEiR4BPlXwbXSP13IZE+YFwikjeIT8C84U+evdNnDvjnP7NvHf31FjfLnEjQHQpKca/BUn3IanG9XNetWmN84uR2gJdzrHVt0FoMBCvhc7nH8RWJAzTHIU3iHFuimmehN/PQzbJDHuZqGVxCci7OE1Q4k7S0qlw5/iNxgx+WrOBWi771XVq4MKK6vbln/xplZrjq2FHzes2znWJTWYnCBUkq2AaVzvPPr7qMQpf2b8qq7P8tSg5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuEGd+2txkPqtHddMYGTNSzHiiaqyDdOg2BPWJfbT7k=;
 b=eIiIZCPjeil6mXYQ+sep5IZX5PtF8hHqIGRISuMGRkGf0Wl4K/y3gjqVx2wJVZ2/lj1Q3hvL2Zul0odg4qWwcDDhFSy1VOLEc6GpN58u1hGFyUDeTMytccwP5iVTZfnShviH7pwHpC6W/HRNGTUQ9/mPotuQZKvpRHQwOdIBrr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 13:55:36 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::84e1:275d:69db:1748]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::84e1:275d:69db:1748%8]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 13:55:36 +0000
Message-ID: <1aaadff6-f0c9-1ff1-c06b-72751b5056ed@theobroma-systems.com>
Date: Mon, 5 Sep 2022 15:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [docs] [PATCH] ref-manual: remove obsolete product listing from
 FAQ
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220902201705.101145-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220902201705.101145-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c549d718-6faa-40f6-c141-08da8f464f0a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6913:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d0GXpnM4pZ61m6MaWpxY63POQS9SqG7dmSb/kvKvLLOzVESJrsI1W7bK4b/JIWNC4d3Pk5a1yuP5S489EIRiEGws9JjbGvAKYPuV7Lyg2T4jI7R7Z3dtoUrZFq3+zP94J8CgVP1+DmRZjXFJ2oNlI9pJ7h54tGVZiq7JvpC91rpjOnZ3fTsAjZT4tJQG+uqpfyj9cX7rEvc7J4X2SA2A7T3LieyG/0vm59brDPr8f+crWhbSocL+/wD2IMzWimpvjJCDWSl9PHDtfyfvtQwck9Jo4JaOKAPa0cybueS1W/VMT5P95m0ixEj1vEN/FzEgjXUN24fc4bLW10pS6vx47oupWa2E8dxpDv4UtBRbY1I1s3qFTshe9WuoUygIlymOUijrldDiKWmPezx6RbDMAYNGNzZkVIeriZdPPDyIrYklLNgTulaX6MOn5M+lHVmykFAZSOtwJ8cBb+MJzW/emTmPgiMcDeHoKHKjVk87y0mhADzPqrETtYTO39pPvKiTD+dxyKfDn+Po2dGQCTsq0m5FJ+R00Ts0rSyqnriVXGw+sQ9561/M8UQ5CoJAGyZ6/H5J/XWlR+UdJi2tflPLkMUeQpArbDAeGl1MRXIDXjH8rDT5KGeEyR2IUIvK4Z6XJ9j784NjwFb2J/7/3wGMbJiP65uxD6fm+bxPtJ7U/3kopuVWkMyues7xc2QskUMo+mdXZUOLMLqJx6hIO6wOsSNGLTSCU+SG8l43Tjn7SFq8gGkUcBhiQURH+OIKRANA+0LjnLwCv43/z5vBicPGiEozVMwzivQczbiTZN4cgvk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(346002)(136003)(39850400004)(6486002)(6506007)(26005)(6512007)(478600001)(53546011)(41300700001)(44832011)(2906002)(2616005)(4744005)(8936002)(5660300002)(186003)(316002)(66946007)(66556008)(66476007)(8676002)(31696002)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SU9SeHp4U054cGVzY2hWQnF6cFNDWTh3bHhMVmxwUjFmcDNzcUczdllVZUx4?=
 =?utf-8?B?ZllENWhKTERPU0J1VjZHWldDc1p4b0pSMWhjckFmWFIrdVk5eFlOZEtwa2hi?=
 =?utf-8?B?VjIvK0RvUlh4L1ppelNMem85MkVLNlBscWxkbzJjQ3lwN2YwY2FZb0w5emQw?=
 =?utf-8?B?S1B4QzJoVEx6MkxRVU9rMWZITXRFaVcyajhVeXdWOHNuVDVFSHM2emRZZEZX?=
 =?utf-8?B?UzhHSjZtNGQ0WnA5U0lFU2NWNGNmdnZEb1pVL2wxWkRtMTJyeUVBQVEvTG9L?=
 =?utf-8?B?SHJKQjk1L3RiWEptamJPTklYbVQ1dWVxV0xEbEwxUGFGL2JjdGtwRzMzSGZP?=
 =?utf-8?B?UGdTaGtZOHRzck5aa0FmZU13SUJoUlI1Q2RyQnY4Q1BHeXhBbFllTmJ3TFd5?=
 =?utf-8?B?TTM5RmdjUUpSUlROQ2x3dDAyN1R2UmM2Sm00QVdUdlE3emtsNEllWTJrQlJ3?=
 =?utf-8?B?WklMclhyR2J6REczaXZCTVJrYVFnSE9UV0JWLy93bHZOT3RudTdEWS9xVTZj?=
 =?utf-8?B?UFpXSDR2MnF0TFU1Qm85UnBoNG5hVjdyT1FzYlBvZzE2QVk1T3VLMnZEQ0dq?=
 =?utf-8?B?QU5OVlJxcG0vbU9MZS81d3EyYXFFQlB1TUNsK2Vrc1FpbXNTRGE3bk01LzVX?=
 =?utf-8?B?bGlFZ01sQWtuZU1YVmUxZ09Yd1l6cmx4d2dLaDg4VnN3bFpUeXlOWklTRHhQ?=
 =?utf-8?B?TFR4cExXSlFtZEZRdWNCQ1BmblBzWEtlTDNtTzZlNWlPVUxuaGhocnFUY0JB?=
 =?utf-8?B?R1ZvbDFmcW02b0EzaEdhR3pNZlEvMkNCRENiSmlISTNHM2VUbnpvUDFhRko0?=
 =?utf-8?B?dXpOVml2NmdDOWNRM3FqdEVsWmNndVB6T01OVzYwV0U2b2s0Q0RNSkJBQ0Y4?=
 =?utf-8?B?OGdEMzNZdDZkUUE5czdBRExnUWY5cFU2dWFCZllkUVZMOWlXOFhXdmV5ZHBP?=
 =?utf-8?B?aVNJTVF1c1prNDA4aTl4aUJUOE5SVVdRcEtlTkVoZmQ0OHZDd1RDWVpLRm44?=
 =?utf-8?B?eU01VkVvNUY1UEZwM2w2UHpJWjBQMTJ4VGhuelR5d0FEamhYQU4vWkpZS25i?=
 =?utf-8?B?eFhVV0Q4NkQwYmZselVFZHRIZkZXTVJEbDJHUk1Ubnd2WnlvRmZJTHY4cE5C?=
 =?utf-8?B?OEl6L1BZMXVVSGFBNENwUFB1d0Y0Ti94OWZyV2VuRmltQytuY0huNGRsbmhq?=
 =?utf-8?B?V0VMUkZwMTR5QURod2J1WDJnYUVkSFBoWCt1aVdoRUk3U3UwNUVxY3Z3ZUhS?=
 =?utf-8?B?V1ZmenJTaXpaMGN0bmJVaG9kNjlGM0wwb2lNbVNTQzY0enVrR1E5YTB2QytR?=
 =?utf-8?B?VC9jSkhmTUNzODVMUE5xeTFuYnBORXVtYVloTkZJcW4rbGF4SWxUZk8rZ1F1?=
 =?utf-8?B?M0RMWkd4Qzg0cmk3ekx1cXIxbXJmUHh1RG5mUjA5TC8rMGJQUFN4c1EwWUpI?=
 =?utf-8?B?UENlUlZmcEpYaklIZmVqUHZsRzdwK2FwWVhjRTliUko5R0lHdk4wczVKM0RH?=
 =?utf-8?B?Tm8ycklxWnVIT3FESlhwK1NXdk43cmdwRkZhc0hzZHdRM3RYbzR3TkVYbElz?=
 =?utf-8?B?dGtQMkN1OXdlUlErQ2ljRytYMnowVkdtVjQ5ZzRqZHRSMitMN0JmRXdXK1Jy?=
 =?utf-8?B?NlkyVHo3aTV4RUVpSW04MUpVTjE5eWFCcUdYUzNFVkV6MExWSWRUQW5na1Q0?=
 =?utf-8?B?NUNBTXVMR1dERVVyUEk3RkJkYjR4OFJhSDBHODdKa0RXcVVVU2NGemFodlVn?=
 =?utf-8?B?WW9oc0RZOWxQSHlFYU1oNjdxZk1SekQ1TnJVclBSbFJpeEt3NnRlK0NxcVkx?=
 =?utf-8?B?L2FiMzJHTkVEUW1GbnBQNDArYmE1NmxOcTh0VmxVUUp6bC9hbC92NlFzL3Ir?=
 =?utf-8?B?b05FeGtjbDhrWUdnQVFDNHh3YW1tYmpUck9rMHFUTDhmZEliRS9jeHdRa3hT?=
 =?utf-8?B?dmZJQ3B0TEdabXVodzV3dVliWTRQNnlEYUdKUDdLbm9pbGFPallyekxFaW1Q?=
 =?utf-8?B?WWdKamloNXU5eDV2KzVMZ3dsK3hPSGh4bUg0ZFhuRzFhaWFpNEUzOTQ5V0pn?=
 =?utf-8?B?SER2dk44VEVSb3l2QmpGazJJRFk1OVBpVnQzMHlUOWp1RGp4Y2Rrc0V2VWgr?=
 =?utf-8?B?MkxCVHR5dXZqclFOOXJvaVhtUEpkSHhsWlZYNktwelBDWTFuVWdxb0NwbEQ3?=
 =?utf-8?Q?azFGtnj6sivJfMq56NJXbIs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c549d718-6faa-40f6-c141-08da8f464f0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:55:36.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xrNv31hka91fJ2RrkMijEQeGhzGoFrsqeVJnjGSgkmlS4nbFLZPmdBf20wBEgU9eDxQjjv654Ac61EUjtcFCNq2R2fzm5JfE7qW2rmHJ54nrStOpA2LhZCd5I9FTbvkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Sep 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3141

Hi Michael,

On 9/2/22 22:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This removes the single reference to a product built with OE.
> The URL for this product doesn't refer to OE any more
> and this FAQ is problably not the best place to highlight
> products built with OE.
> 

We can point to the wiki page Richard gave you in an answer to your mail 
to the advocacy ML instead of completely deleting it :)

Cheers,
Quentin

