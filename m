Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081DAC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 07:55:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web08.3166.1665042901886095392
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 00:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=E9yV2xwM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.57,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQJMORk4aRMfY3bS1RZpnLV0NMQEoOmYM0PQ5213FyYUKwSQ/yWpgTrGaJ2QX8PaoqdorUWEm9sifDULRn+y3SHMQRwwuFmjNN9MlaUgMR72MkaB4J/AGxRYOI6gbNbBpjQgnsb4vklTuGugc+iH4qvp+ofdkASl/qL7rtuOlvOsTElDbrM+/QfJMqo2HKYhTzkaYiZOtjORd6QRkQn6VfMd/j+f2Jqzqrr9gWdMC0N32I4wRmjeC32iCMWlASFEvtnnaMEMeuaypxGo1KLOPiuNb6lbCEeVDhi1tqTafObC5AjZbv5SklFXzeUjbDSbxp5/u4DZ748mpvsY8OuJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuNGQ8FDvwuSWXgHEu5XpkJQjmk68hq+Vx3R7SPjQc8=;
 b=c208TQu9D8QbS2WTnu1jWjJFOed7FgcwSBeDukG6xW2JeOL1GiKPgfcnTYtr1HqH/AoZMoiABDlPC4vEG3C4THhbqPcTeTU/AWc4x7QFr1/aJp83csvPw50Bj/gJElIdSCV7Hz2kM2LEWEhtNb719902sOvL1RTEr8ey6lFv3/v2LKKrvMOW2zkfwID7gNEH/AD5/X6Ieu0zDkGhW/WFHnJxhqhxkzkoIo16mfgiJcxuFQJHvXrBewrdp3H5QiS1YM3NmK30RC/oqs+LizWStlmGBtQoriVRap5mHVVR/+LvB2so0banXbv2cL44iiLgjtPdqTR3lpUzPSeGnP/aJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuNGQ8FDvwuSWXgHEu5XpkJQjmk68hq+Vx3R7SPjQc8=;
 b=E9yV2xwMDE92PP0nm6XG1kgKbH9k+d3oQ8l5sdVY/6adgTk1Y9A7Ec0PANNIb79c6IvGAbWxvNiGIIKfIr285bvmCk5sxlz8OK1M9L7MnHLwjlJUsxDCtmNJ3W2d8g3kv9aAaShgW+qf1g0fTzbzsXHPh29RU6R7ia+zZRFQpJfwRTahStPtTgumBPOYG1WQ+vHVlLGNXznsUUPw6yAJgrp5Po7jpxv1vRNn3htnQLC2zTCckXrxjb2MA3Ss62RX4YZ+w/cHfjXaP2QAgru+NHHEpfdXMcnEJTH266EKZmCb3IEP6tWvuzQ4L42GyQPISMdLdWyapTjCg+bBUnbxnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8457.eurprd04.prod.outlook.com (2603:10a6:102:1d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 07:54:57 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:54:57 +0000
Message-ID: <e1eb278a-10da-7461-b0f1-4e75952a20c5@theobroma-systems.com>
Date: Thu, 6 Oct 2022 09:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH 06/30] manuals: add references to the "do_deploy"
 task
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-7-michael.opdenacker@bootlin.com>
 <d4ec2d36-c931-3732-356d-fb6e8478803f@theobroma-systems.com>
 <46756296-b00c-82cf-3102-64e35bd055c7@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <46756296-b00c-82cf-3102-64e35bd055c7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0048.eurprd03.prod.outlook.com
 (2603:10a6:803:50::19) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: c3370099-fd19-475c-aa4a-08daa770101c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BP7CXv3JqYQHM++41Ir6S02QWZAJXsvZZEWkHZtSnxIoPBzG/0pADY+Iuui1XvOI+CTLSxyxOjQITm7QcoON5B7L0yv3WL81ghWCXtEqSLTYzM5V4YqyuBd0cU4f2c1s3kEr0kYTX9Qfx/22yDIymmGAu+fY/BRtWq5pvhFns6CoJlh65uVEF9y3+9e5+gOwaWjLA1xAT2waclhkh5wY5aNc8gobr5VryHObQz4//LxB3n6kIQZ70VgJ1XRtVwwh3cYOMpGbgpE4HxUmFRZ6rYv8pi6PKh+ylKf+6tgpEop+2CIBbtvuFfTxQK0SU4ct3kSqh++Fumgow7nyk6rT/ppI5oKh4QvSk77gX6BJpcU0y1YRgOMNe5dRyWgrXL0DTaXuW8YX7xx0QMZp6E/AvyOFxfvXhoSpT6Y0j1izU/zJuKcuhXw4fWiTAXTki/G5xmPyNcDThl3DGK3GQoa9QRnmylfcr0+QTqIisA+gm5F9evIavzPPyVZ86w5F18sjeT9TNmQ2kAXZ0InqzYuBNf4eTuvXMkdvTAYMgMrzqmM86iUt4wZLWdq6gTBVPgKCN1Xxbswa+Ggb9UuluUDKrbA3FkEhiXAN8o2H2Kk7dfvSLBxVU3B9TKea6ac89U4k+5QEhCd0HfA+sNUs1DzPS8uforUWfjQUtIQPqGHpTKt56tSTzXoKcIicl/tEcNLOvsR9lyz3fz97LL1xoGEAEIXIvXhgoKIKXzXONI/W+IM/ESJTLFOb9j2QFHkXcwRWUN/p/2UFiGUMc7h7uN0rK0i4lPj51dc36A9d1kiWFnVBvQw81uo7AaxZpL8ZAm0MWQRu8JSwF240MQZyn3fp4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(39850400004)(396003)(136003)(451199015)(2616005)(44832011)(2906002)(8936002)(41300700001)(66556008)(66476007)(66946007)(31686004)(31696002)(4326008)(8676002)(86362001)(6916009)(316002)(6506007)(53546011)(38100700002)(6486002)(478600001)(966005)(186003)(5660300002)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d285bzFicDFCNXhsNTFMMC92MEI3MVdsdE5GYlc5RHpDZDgwRmxDTUNIdWlO?=
 =?utf-8?B?Q05sRi9laFVkTkVaNDg4c3ZBV2U1WXlTU0MwSHRidldXUDQ4VWNpV01nbk9W?=
 =?utf-8?B?aTZBOWxGMENGVzRMdU1HTDY5Wml3YVRjNjZDd2NHby9TVFZyQjh6eUFjRkhT?=
 =?utf-8?B?Z3NrazRmMjhZUDUrOWY4M2NqcDBsYmdBYmUrek4yU2NRWFp3Zkk1aXYwZGFm?=
 =?utf-8?B?YUo0c0tLdnFLZC9WS3JuTFNRY1Nqb0hUYWZabzR0aFNib0RnbjJLakFvU3Bh?=
 =?utf-8?B?SVdHWE4zVCswNkFmK3doN0t2ZHFIM1Jkb3ZUT3QxYkxZSnRuM3hPMFVnb0J3?=
 =?utf-8?B?V3JUUHVEZ3JjM25pTW9QV0ZVNmI0R21yWVhXUi9yVkZsNjg0bzJUL1JVVFhy?=
 =?utf-8?B?cHFJcE5hZUw3ZmtGcEVtbVR0b2Zqcm1GbG00Z0t6MmJiSnVQa2k4Y2xFYlVh?=
 =?utf-8?B?Nk1VQlBjMUlYV2lsUzcvdlpsMjVNdHdNNEFrTVNFT3RYK0srUXB5eFpmcmph?=
 =?utf-8?B?dlFyWGNiZ1BvT1BWRjNFOFgvdTZLc0Y5UEhsYktESnFPUEE1SVE1SEdyNXBr?=
 =?utf-8?B?SlRXcnFsTTlFd1loRkIrc2VKRGwzUU1wc3d1a3NnZC9QMThhdlFndHV0bUg3?=
 =?utf-8?B?VlNqaVpqaE40cEhqY1FLS0xaaTZDM3llVStlNklhNmJyRnhCbHV2NTZCN0o1?=
 =?utf-8?B?ZmJHL29sNG55QzR5VCtvNit1Y3JJaHlPUlU4NityeUZjaENDMFhiL1FaUEZY?=
 =?utf-8?B?Y29pSElPK3VtR1kxdkp5V2wrQnZuc0lTVUh4S3lBRGVFTEczcE5xdUFla2pq?=
 =?utf-8?B?MWN5RmJVNEVtYjd1SlFDSldhaHlYTVljeDFUU3RPdDRic2grejlrRDM3VW8y?=
 =?utf-8?B?ZmQ3NWVqck9wT3I4ZWFWem50UVd3QTNpS3N4ZE43QzhCazBoS0JzNmpUdEFI?=
 =?utf-8?B?cDcvaXU4OWgrUmxZRjJTZWdudzgvbkZRREpaRHNEZTkwL2ZJL2hheWJPSlVq?=
 =?utf-8?B?OWZXYW16d3M3d0FwZEVOWjRibEZZY0c1WWdtNVFDNEIrUkV2SHlMY0JQUmE4?=
 =?utf-8?B?Z2lQM2d6OFFoQXZOVTY1N2tQUHlsVThKZ25yblVoa0dzSEFZdUJMb3VMSWly?=
 =?utf-8?B?TUZFK0x3anVIMnJFNURpQjhnU1BwR2RoUDVMTjdFYWVxY0xPR1A5eG1aOXJC?=
 =?utf-8?B?MjVJN0hPbjlQWUw3TjhzUG5uUEdtQWhXTHh1V3dRMmcvS1p6d1lHWkpyQS91?=
 =?utf-8?B?YmVqc2w1RzA3S1AvN3Yxays4clJVcGxVQ3d5VXphSmlsR2lPcC9Dcjc2N240?=
 =?utf-8?B?RWd3anY1UklodE1SaUl0UHZMTzIzODltS3VYa3JvSVF2L3JwV01YV3VwbkhL?=
 =?utf-8?B?UkhobCtzbzlZU3BlZStIVVU3dThXVE5NbEJtNnJWWSsya3dmcVZhTVdReml3?=
 =?utf-8?B?N1JzQTJweDljczJ5Wjd6QVo3RzViejRGVlkyYVk5cFpmQTQ0N1pvTGh4amRx?=
 =?utf-8?B?WTZCQnJJeHJqdWtYNmdCY2huRkk2alBSVkdOcWRjTU05aVA0YXowTlMveXZr?=
 =?utf-8?B?Q2NyTVdwdG1mTWpjSGk5bW9HblIrcjNJbkc5VndxU1RDamZ5bEU5Nkova2dN?=
 =?utf-8?B?OHlReXYvZkxFdlJCejVIempJbllyVEVQekVJSWdZSXlhMjkxR0RSZzBBbWNu?=
 =?utf-8?B?R1JkUkZpQm9pTDVMd3JGN2tIcFpjbG5BMC9BVjBmNmxQM1VwS0IyaHpFNUk1?=
 =?utf-8?B?Z0dIcHlhN1FWL3dXL1haeUE0N213N2pPbXZOUGFWbEdCRGI4VUR2UWxhMmhq?=
 =?utf-8?B?bmRUZlJtdHlJQnBYaHlqRTZiSjRvT2s3ODBhMlN2UXZBb1dwcUg2WTcxbGpn?=
 =?utf-8?B?ZHlseG1JcDFCcU1KeWNBUlF4amtTKzhpMUt4YmM5N24rc3g3VFVRSXJHVUpW?=
 =?utf-8?B?MGZiWmh1cnhmNkxLYm5Oai9sVUVHblZuT3hqdEVIN2JTUlRWYVhpNWk5Y1cw?=
 =?utf-8?B?OE5tYnAxOElFbklVU3M2Y24xVDljN2w1TElHR3Bic3V5K0I5RytQMzFheXpm?=
 =?utf-8?B?dnlEakR1Rkl0QVlFd3kzSVMzYksxdStDY0FjN1Z4MU41MjI5MHBZc3dnK3pz?=
 =?utf-8?B?ZzNJZ2N6UUJzNjlBSlF2clQ0UVpvNHlQNXNBZUQvYmJhbTlocHlhbmJoWFhJ?=
 =?utf-8?B?ZWhXQzdPUWFFR2VDRXAxLzYxOTJrSExtcG1tUjg4NTRWM0JZQURta0x5RGtB?=
 =?utf-8?B?Nnh1VVF2TFZxd3JTL1Z1NmdTUFJ3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c3370099-fd19-475c-aa4a-08daa770101c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:54:57.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GaeKUyWpm0dtAxwy3RRNtjgSTNuZRt4MtBGs4Z4pHRmxn4oEs02ln2BhTlQBqNF+Qf0hgSjgaYcmeW82vjVpb078IxOgj/L03TL1G+Z13q1DbVzpent+CkrcP/fF9fSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8457
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 07:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3294

Hi Michael,

On 10/5/22 20:11, Michael Opdenacker wrote:
> 
> On 26.09.22 16:04, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> [YOCTO #14508]
>>> Reported-by: Quentin Schulz <foss@0leil.net>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>
>> Missing one:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Ddocs_tree_documentation_migration-2Dguides_migration-2D3.2.rst-23n210&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=tklDwq7KiSJJAzIdRIMrg5CO3BL4eh46cNdDXhIqVCblv2dPMQ4EHtSzD0hTGUIj&s=lZwEwoYcbSMrbdIrodxOoacnAGgXVqGLaYZq8aze9qM&e=
> 
> 
> Actually, my patch has this change, unless your thought about the 
> instance on the title line 
> (https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Ddocs_tree_documentation_migration-2Dguides_migration-2D3.2.rst-23n207&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=tklDwq7KiSJJAzIdRIMrg5CO3BL4eh46cNdDXhIqVCblv2dPMQ4EHtSzD0hTGUIj&s=6C9bFwADJEfE32pZCwMjwm8f8EopviCTupqux1FKXhM&e= ), but then I didn't want to add links to section titles.
> 

It has the change, don't know where I mixed things up. Sorry for the noise.

Cheers,
Quentin

