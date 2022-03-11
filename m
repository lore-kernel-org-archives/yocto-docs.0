Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EA6C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:34:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.49])
 by mx.groups.io with SMTP id smtpd.web11.8232.1647020079429403518
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=nv0fYvLc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biN7w1m4AuJXcnhUDjaEf+OtdYlBJIGPMIgOsLQgfZowTqBtC56X4isjI5GyaXUDV1i07bvvdefnxR5MXF4kTWoUJ9/AEtECEPVltPdZZ6PuwzUhWUE0oBRmSkWPo9jZwCPaGY8iixP8DNhY/8caB28EWj+PpeLy9e4u6PGHuSwo81jL+Wvfw5Ghvb/XJN4tm54BgwEkL1lX02mVXIEO5DApiQAFowQeTbSJmPWTr2gqFf5twEGVHz27NCyljcGyQYvfgJh46LfBMez42OfbFYM7LrHPlnR+ZK/nxHAaxEWpt8AQdutUo29Gv51dYhYTNCrF9a4/8zU9ZF5byjs9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7HwSChpOkC/4zboKI0IrXEPcTslBMskUb3jIE2t6O4=;
 b=ea779tsu7UO4F21u/lI5qTrDkxDL6LlIzyN3T/Ctpd09ySGB1aCfJGLBoqmeR8XQq1pNnqrzBsb2YNzkBqR+vKC6o29zgPXUwRWxmbG8SbtNzwuJrPI59XGk3uMV95hDUqhU8XgWp39rK4N7Gy2Cd8fe/nMxaRjo2dQgv6x9wdBSXu1qNZVxzw41sPIXPozYhkRosJX77PiCGXE77iBO/veSdz/uDHguqjLnD7iyS26JRJ+qBz5YN8iSqfLGdQGk2tnDYK9YiDO/4y5Ph9mF+hKfV5UZ5Mb8ZXEGk/mXFlCAQLyIr0IWfEQ5ZY2XlLYHMguFaBuIWd5MnPAykmUHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7HwSChpOkC/4zboKI0IrXEPcTslBMskUb3jIE2t6O4=;
 b=nv0fYvLc1zxNjWH7IJ2p2vB4vWq4UBlbYRoPafIW1giIRfSZ/uALiRvWaMyRLwoEwhdUAAoefplJgS587A4/vnZU0B6q5VeOj0sRkoajYyj7m3mlruI71ofOhj86LPj1d+v27QPslfkdaTj0aq1YSwVXzwhiB1RouWu6P64MUtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR0401MB2479.eurprd04.prod.outlook.com (2603:10a6:800:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Fri, 11 Mar
 2022 17:34:34 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 17:34:34 +0000
Message-ID: <9add9f9c-3659-e97b-57b7-5f19d75e4f8b@theobroma-systems.com>
Date: Fri, 11 Mar 2022 18:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [docs] [PATCH] manuals: inclusive language updates
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <16DA20B7CA534643.15718@lists.yoctoproject.org>
 <66ca0a6f-cb1b-b2b0-e1fb-31239a5dff74@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <66ca0a6f-cb1b-b2b0-e1fb-31239a5dff74@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0025.eurprd02.prod.outlook.com
 (2603:10a6:803:14::38) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f2f6ca3-b0cd-42d3-8fc8-08da03856850
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2479:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0401MB24799BF3ACB98772B0B58761C20C9@VI1PR0401MB2479.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oczBSDVu4WUIW6FyQFUrc9kszfn8NDUeZHos0tUjq0M60jne+UKfbM3tmIoj6CJzdSng0GbR0LYw0/wIOLXgrP8m8YfcFfqpdPUGTMzUQu1NXIPhRgiVVG5XAxzcaXwck7nTkoaeVWtr+RbJreASlr3iJT1pM6aklABYHM1LMH7kluEH+BX7CQJypRdnLfZEAzaTor9G1vpus6oSwCikvrfhjlvETNHcNor5FnTMas/A/CFO1TA3qxm5jbshsMgN+edGG8QUJMROKXQA1lEA8SLOiHVYkxh0JBZyGd0dyzTPRQRq8lh13PysWMWjtm3PBDKcP5+4D6xgLEeZ6wZ+USud5SvUJYeJd+2A4LmHg/Nri6fja3p6pHXSDlO/9kvxuBV1mSMYUbyYGwHR9r4fYDNG/o+rC66TSWvcJ3qK65/dTru0FQq+7jNaAdf9NYcXMJNgXNAGbqFw8Pa9kf+CJi2/cnK+jW6s7AVWRNOsvrMN/+RNwcmEGIr9bHQhriX2NwYHCvzuKFK9dTfj2PBfehugcH/D8NwuauHa/ffPb1skiQ7ngGnu3tHDJl0eijwG0YvJRv/H4Oocz//dW8xRb+HbZaXPRAM/MJwLBeQn/AxNySyQ/UL4Ofuby+9qn0uDhEQOfadrw7XFqwS8VBv3fHzQOHxr58qBjMbmV2+RcHEzRNRO+CENYRPedAknzCLpH6xOp1FHHVSQ1JjT4mtLJuoO+xigzV+OlgYHTSQhSm/jXC7Ne1tvvp//qlLe3TPq3rGe4ZJctquru0R+amDQHVPshu+jMevAFpCga+tyh3U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(8936002)(186003)(38100700002)(44832011)(83380400001)(2906002)(6512007)(6666004)(6506007)(86362001)(66476007)(66556008)(31696002)(66946007)(53546011)(8676002)(36756003)(316002)(31686004)(966005)(6486002)(508600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTNYSVdKUGpvMzh6WW85VVA1alljRFBlVnMrWW1ZZ3ZUOHFVNlVGY2kzTDRq?=
 =?utf-8?B?Mm4rVzhKNzVkQzBrdjJkZmkvSVJMSSt6OCszZnZqWDhlRGMrOE1IaUhJMHBR?=
 =?utf-8?B?anFmN3NPMThyY0xXdjdjcVNOcjdIZGZMWC9SWGFKaGcreVNaZDZ1R29KTkpr?=
 =?utf-8?B?VWNScEpWNTZERHk5eTRUMEhQTG1MbFNPRFZReEMxd0NrdVUvSEo0b3BHK0J4?=
 =?utf-8?B?WEZ5WHhVMG9NN29UcFJoclRydTNYVjFkUmY3YTBoUHpVTTRyaUtQWEUvQU8v?=
 =?utf-8?B?U0lFalczTC9WdUhmY2VydUlWN0NMV0V2Zm9lMVVYamVpdjZNM3dDWUJuejVL?=
 =?utf-8?B?eXRzRUpBbUJmdW1SRE1zRnZJbmZIaGY4UEZndU5UWEZIR2w3VE5XZWJoakVa?=
 =?utf-8?B?cWtXMDRQNCtkNkpXOGo1cHBTMGtQSVVkZ1NWVHVYdjlObDA1TjdPRE5IZS9i?=
 =?utf-8?B?VjJWYXBlRkd3ZTJEMHdFUTEwaFgvdEJwemY0dURtY0pzdENHQlZZcDJjVnVW?=
 =?utf-8?B?L2I5aStmYkhWT015ODZZSzFGVFZqeVY5YTcxUDFORzBJNGtSQkkvdUxmR1Bu?=
 =?utf-8?B?aC9MVjNCTzQwWWdxbE1vQ01uLzdpWGtHcTlXaFZDbkJaa0RwODR4K1NyYkV1?=
 =?utf-8?B?ekR1eVNJRUZwL2JDWFhDWE5IaFl6cmwxVGJjbXBURDZSSFM0ZHNvYnRtcENi?=
 =?utf-8?B?TkttcGNjc0p6TDV5QzA2ZGxqSyt3dndOZlMvMUtmZWY5TjFRMnBCT2drZGdI?=
 =?utf-8?B?UENTTVB4UFFjNHhZWFdoY0lHaXVwMHNiRHdtU1p2eGxsWlROVjM2eXhLSkhH?=
 =?utf-8?B?UG85UjBEc0pzNmg3QjBXMjJFbWpkd2dCYmR4eWtadk81dVY4Q1NSb1N5S1BR?=
 =?utf-8?B?VUxwc0ZlZVQ2eVM3bHl0OU95VnQ0ejdON2hqa2tzdFJjZ3RSaEI2S1VVK3BM?=
 =?utf-8?B?ajVRbGJ1Qlk0WDZpOEp2ZmRMTHFIZGxyU0N4OXE5TWNveDlkUXJSMEM3ZTJq?=
 =?utf-8?B?S053VW1YNzJYRXArTjBhRC9qZm9KTmVnNCtvZGpHcVlXdDQxSVRPbXhCQXFS?=
 =?utf-8?B?Q3FGT2hDMjJsSEFYTGtmQzJ5c3FUUFhEc0QyR0xmSlBmWWNlQUp5bENYRGpr?=
 =?utf-8?B?akJsRXRQZS9ic0xxaUFTMEVmZHVoS3ZaTElrVnQ0VVZVbW96YkJ6Q010dVZz?=
 =?utf-8?B?N1paU3ozdSsyT3FPRUVFbkl6YUIxcHhOSWJKSGYwSVFmdFFZdkM3ZG8vOFB0?=
 =?utf-8?B?YU5wS3ZZZUdVQUV3eDBtV0RqVXRJY3Z6em53bjk4ZXhnaDhmajhrVnk1YnpH?=
 =?utf-8?B?NHM5dzJpckhiak4vM3c3aVBlZEgxaTZiQWN2TnU4RHhKeVV0aGZqRDI5eW5m?=
 =?utf-8?B?QXN3TklkbWdxcTZzUjhhemJDUXo3NVRnbUU5R0xidGlTaEF3MENkc0tJc1gv?=
 =?utf-8?B?TlZ5OTRLNC9DRXNsWTZibURhVzBzZ2V2T1lRbEVOWHMxYmRIem9vZ2dpbGo5?=
 =?utf-8?B?YzkxcVVzd0tnSGZFZXA4ODk4U1hGdXJvNXdzeDIzOUcyakh2UGpER0svbG1u?=
 =?utf-8?B?dUY1S2xoV29RbkhJUG9MVWRnYW5Ob0NWaFlVK2ZDemRPa002RVgyWjFlUGNv?=
 =?utf-8?B?RnZKbTNJbFQ0VmQ4aTZSRHZyRnUwb0RJSlpWWEtNMXlyRXU1OGd1cXVpNWhJ?=
 =?utf-8?B?WmMxT3lvdmQzL2gvK3ROWTZZSUlXbnpOQVFIVy85cGtJanpiS1l5c3NqY1Nl?=
 =?utf-8?B?NFlkTEE4NDFYdG91czJRWlZIM2dLQ2pOcEVPZFBuRjZleFpzMHRBU0svMmx0?=
 =?utf-8?B?SGVDWjRpay91OFhJbU9sakl3NEMvd3I2VUowaUpPRzVBNFhLTDM0M3A2RHFi?=
 =?utf-8?B?WERkbWswL3cvb2UrdG9tRXZESGRVb0VscmROVHFCZ0tjd21xcncvNWx4T2Vx?=
 =?utf-8?B?MEpCQ3c1ZmY0V1RpOGRGUzdkdFhNSjFmNmJEb01qZjVVcGN3QnpEMmdUY29G?=
 =?utf-8?B?K28ybTFpSXJpdjZQVnN4VXdkT25NdkpIMk5NWDM1V3k1cWhUMGlUK3BrdFRP?=
 =?utf-8?B?Q21ZSDg4UTBlMk9VWUNaSldIR2E0VUxQRVcxdz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f2f6ca3-b0cd-42d3-8fc8-08da03856850
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 17:34:34.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 po5d2uIkaKRavdig2RoC8nuMJcPtijnGBQ0MLZwhBANkQ+1eyI5VWqF5Oxz8k6/B5pK0QQoh3DQgJjq9GVzxi4VhAdiD56U/x3mApBPcnJzuHZTrVvMs6cvdPBxw+eDY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2479
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 17:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2598

Hi Michael,

On 3/11/22 17:29, Michael Opdenacker wrote:
> Hi Quentin
> 
> On 3/7/22 15:49, Michael Opdenacker via lists.yoctoproject.org wrote:
>> Changes identified by OE core's
>> scripts/contrib/convert-variable-renames.py script
>>
>> Original variable names are kept in old migration notes,
>> but references to the new ones are provided.
> 
> I merged this change into "master-next", but the change disturbed the
> alphabetic order of the variables. To keep the commit easy to check, I
> prefer to fix this in another commit.
> Didn't you have a script to restore the alphabetical order in the
> variables.rst file ?

https://git.openembedded.org/bitbake/commit/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst?id=98809ebc6ad51f0a94cedccfaff9c11d3744dc0d

But I would very much prefer to have it also alphabetically ordered in 
the source file :) (but add the commit adding the :sorted: flag too as 
it makes sure that the output will be alphabetically ordered which is 
what matters the most).

Cheers,
Quentin

> Otherwise, I'll do that manually, but I won't be very proud of it...
> Cheers
> Michael.
> 

