Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0937DC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:50:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web08.9862.1652266193693801245
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 03:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=PnuY83Az;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of5v5369b5sS3XQt6pfvfjl3b7BQ0+sKOngtQWRLocfZqActs5vOJjwfj/CT5wmU3P1KHxujfjZZJHigcEN79gxtoeqbwq2keWiAPGklwgoE33ewmqqsU1UvBGtqfhH6my2vrcYhVq2Bd5y7FK9S6ycGoW7CNslJbTQo9djCUH5Aj2WDMEBhXjuM3ON64JUIDtMbFap4kv0bK2M1emUuxsZfcY7GgcOa8oqU0rdyBxOHn1wiX1KPlQZz9SLUIHwBRgHReKeL6TE4Ws68+aTe5r+9lXTF7mfvBpg+z3VqIBx0+BXo2wsIO7O/nGtPViOaZAv0N8ioRGkgtCBa1oouSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDDcZaUGllL/hJht91hQkIKk+6ojZTeL4zA5EvJC6S8=;
 b=gtgyhJTzIDePD5GPa4lMzshEcPjPVLA6PxAf6ChCEGXpcnYlM9rRSTFK/CFB0aoZnBWcX9JTgPnRJLPip670wemUgLL4mdX9HMUuxcAGOuDn/1NLr2WOTRj7TtBCyHIplWEfw3n05kPlPMAk9n6IIWlFhBJsa6lhK7s+itrL02J3KLCki1iIN+IF4dLZJ7XkMKo2CnxZbuOBCDSJPoJKTloQzXbpK7ExCfHCysKQrOfzPRXv9mAPUYw7Bt5CYZDhFmnZtyAkZCR5ASluZFfMR8+sZv3fReeenc/jx5kj3dI1SvpqKhsiPU8r44Fq05WMerCnczcVjHw5XUkS1GcsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDDcZaUGllL/hJht91hQkIKk+6ojZTeL4zA5EvJC6S8=;
 b=PnuY83Az6q3THTIeqCVPNk193JZP4G2GibTglaeJ9jniA2AaJjsD5zDB75/icJ1tmXeeIZ2K7GxF3f/13+MHHaJrb0es9f19JaiX5WrxdxjhcuXQMgbnSw1a6kTSOojETr4Xce6f4B9UInwVCCqSG1ze8zGI/mViEyPPWqPBy8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBAPR04MB7447.eurprd04.prod.outlook.com (2603:10a6:10:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 10:49:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 10:49:49 +0000
Message-ID: <36a536ea-b77e-6e9e-e9c4-00a3790fb32d@theobroma-systems.com>
Date: Wed, 11 May 2022 12:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] is there an actual "Getting Started" guide?
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
 <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
 <e14d577f-fe71-d71e-6eaf-2e87214a593f@crashcourse.ca>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <e14d577f-fe71-d71e-6eaf-2e87214a593f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0753.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::9) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0663c12-d888-464d-14f2-08da333bf8e5
X-MS-TrafficTypeDiagnostic: DBAPR04MB7447:EE_
X-Microsoft-Antispam-PRVS: 
	<DBAPR04MB74479CC077024278215E9C42C2C89@DBAPR04MB7447.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LuXRwNEuUUR32z3FjPuxxsLSxfQaUlMv8hz2gK2L4qS9NcPf0J+7KnGs6LvmlAP/DjuyWSM+wMWQ8UNt6+Fab75LwwdN95DHrq8X9G6unyZwtt0ydpxozXowA3tJEyQrpoD6TOORFtR4HzPH9xBXtJj/dLspmuGurLrJ4HSD6Sp5GeqrcsECoI4bV0fmO1WHia14oJTwTSGpXj4Krh3mvNxKLhq0xeYxYSfT3dXS90zA5WfapIyQHIQS4sxQlf29iekpj4BOB1YU41UTMbe/Vr/ZCnHt7LXxxX/eLRXUpv3ZShmvkaOW3/NOdxHE7TatT6crYazRkdWuNE4l+SXW6G6++wF3tLTaYRzxzXPrAJCF5E31m/qJODlgWr5d3k9214vR+yjPZHLlBJkVa31FUW6mjV6BZSNUlq6xT1CCblVyl+U8mQiRTMmnXwL3S3SJgTGrRWrVEZkarhcBB5MVGkQCvSaETtwGmiv2YdYI4BxVH1NrzHaf/+6jdxvH/viBu6Z1g9YYxT05INqcm5jvoXsthMmqaboAAhrtePmrn0pFWqs7+EgKL67E54TVhKBbq7WglpjuEQvRYE5FfIe3/XXGfKhwh6mX6iNXuI5q2EFQNnUxGLaDTvfNMIHBYD1lba3ubldQ/LjjsKU7P/TY2/LO62Au7Wz5EOIV4tDpiTe1Rovv3AGAH8t2cUg+ipsjsrA8fxeXfxZ62sU1oTz+arjCwlFEOtmNjXBS4dfaLRo3uETud4Rkz+uRJWnrPS1krDd/+SEJL3SKtNWXj+Q2Ud/QtnHufOXy7dZC8999/qOEeZGxhEuYkzUtpPgR6vSK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(53546011)(6916009)(66946007)(66476007)(8676002)(508600001)(66556008)(186003)(31686004)(316002)(83380400001)(2906002)(36756003)(5660300002)(44832011)(31696002)(6512007)(2616005)(8936002)(86362001)(966005)(6486002)(4326008)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGFRemVRdnA1RHd1bkpKdEtidldqMExLV1E2eXpJY2hyYWtwRWNBb0huelNp?=
 =?utf-8?B?dWUzUTQydVIxVmVmQ1kya0kydDRMTU8wdGp4SE9HSlZlWUFxVERaN1h5MEky?=
 =?utf-8?B?L25ucFBWUkgxQVdUSUxhbHFRTmQrSUhMcVJrbVZZZmNwcVFzckFQK2E4RkVY?=
 =?utf-8?B?RGN6N09senRFS0Q0Qy9mWklSdlJrWEVwSlFtY3BsZ3dlbDgvY2txdGRha0R4?=
 =?utf-8?B?UEF6TVhSZ2NmZVZPbHJqS284VXlMMVZrL2FsUlJHdTdidHF4eEtXd3hDK1F5?=
 =?utf-8?B?c0hoenpUalpoMTRkMzA2K3dEeWZpdm9EbHNwa0pIVjF3SFQ5YWdISUxUMnB2?=
 =?utf-8?B?bWM4QUNxaXJVNDA2MFNLYUxGblRFQ0JhclYvalNXSmNhc3BORThJVmxQZVFQ?=
 =?utf-8?B?TFhjMnRDaHZVai9DZnF4bjlEb0luR2tPRVRXNjVHWXBNTDFadjNoYSszSmE2?=
 =?utf-8?B?bWlsL3Z1MEJnMU5uTXV1eFVySDBHdWt6cnMyT25IZVVxYW5YQVNBeDBDZ1Ni?=
 =?utf-8?B?TlJvSUFLMW1obWJ4WW03SmpEanZEc01SeXdCcWFCTkpJeEVHOWloTjdLZ2V3?=
 =?utf-8?B?d2kvak1zZG5LRHpycENSOU5qWk05LzN4Yi9Sb2JtdnNBbnFQVEpGYSs3azFD?=
 =?utf-8?B?WjZwNzJTQWl4MnFQUWZlOFBjRFpqV0E2T0EyOXI5VlRqVHp2LzJPR1FyMnlI?=
 =?utf-8?B?eG0vbHEyRWM5UmQwOG8zMlJINjc3a1ViVHhUcFVFbDdFWnY4dVpsOVBKbzlP?=
 =?utf-8?B?ZkNGcS95TXBXdzNxRUJqTTVURW5OdnpuZjFXMHh1Z0pld2tKejFOWGVrOVdE?=
 =?utf-8?B?dFAxbDB5UWIzZmxvNjB0eGhRQzd1ZHBTS1dEcklSVXBpZWlLcGRaK0xRd3NC?=
 =?utf-8?B?Vk9LRkxvOE9pbDZiSGJTL2tNWUFiRysxMjJ6SnhnWTlhNHgrb3hjRFo5clFF?=
 =?utf-8?B?ZyszY2VaUDdRWTlhbjhpVWpwZ1VmNUwyRnhudEpUSlR1N3ArbGV5RWhHalcw?=
 =?utf-8?B?U0wxZjVGNmNEQXhPQUt0bmQ4TERXamhUbjVvMDM1M2ZrY25yOWlua2lRWVA0?=
 =?utf-8?B?N0lyUksyMndzYUVRaGNja0FtZHZNaGNpc2ZQSnljYktzV1Erdko5VThxZVpJ?=
 =?utf-8?B?aFBJNms1a1ozZDQ3aXdac3ZuWEpLajE1OWhIdTRNWEFJR0VWYk5VRWRmVFdi?=
 =?utf-8?B?dW84SndSd3FGMzVhczNSdWJjN2F6N2ZZY1djeVZCMmdmc0c2R2ZyaGliTXpH?=
 =?utf-8?B?U05UWklibGlyUW4zbDBRbHByeHdzMTVCMHlwRml3UmxLU1NIam55OE1JQlNF?=
 =?utf-8?B?bzhQdXVpTFJjSFJlT2kvMGtkcnpoNmVVM3JSbXVwSFlHaFFBQTZaUWhYejE1?=
 =?utf-8?B?TUF4WVBDT2hIUndmUU54VlBCZ3JZNDdnOHBGdmVvZ0M3UzRnNVR4ZlJWMEV3?=
 =?utf-8?B?b3JoSFYvaHdnK0NELzRMQjJ5RWZYamF2TFovOUFUQXFkRTcvNm13YWFMVFpX?=
 =?utf-8?B?T3I1bUxLb2RTNDNqZFpWQm50ZFpzWHk5NHp0aVlad2lLNzRYbmowVGNwZzBu?=
 =?utf-8?B?NE9iMW1pcGVLWjc0Z3VTRjJRcmNKVkd2ZDBZVlZITlo3dXRwMkJ6cHVIcS9J?=
 =?utf-8?B?cW1qazljQ3RJSW5ReXByUnN2emVIbUVuY1dXaTBNdGYxbWhCbGJXa0pMZ0Ew?=
 =?utf-8?B?TmQ5cmhxaFRPUUNvckdpbERpS0lUa0JreWo4cWM2OFcrN1U3RXN5OWRKZytZ?=
 =?utf-8?B?dnVXUUtkamoxSCs0VVRsMXRmNmtwRjVaTU9tTjVzZnFNdG11c0VsVzZwSWcy?=
 =?utf-8?B?eEtabFhPN2RZcklOSzlDb0cxSVdDd1BrUE1UUUFhUXQwNkVxOE5MWGxEd0NV?=
 =?utf-8?B?OGZGR05FRTNWc0xqOE9yNk9YbjFwMldBSmRIL0JoWHdNcGFCazYrOXhudVd0?=
 =?utf-8?B?ZklpczUwdE5POWNiRVFPUTVsd3B3QzNBNEttamd0eXFJc0JiY003WEhQRzBZ?=
 =?utf-8?B?dVRST3VoZWRtelVWZXdRM05mYm1KSkhaZ0JraW94TE41bDA1YTlkRUhiZnYx?=
 =?utf-8?B?V21laW0rVFcwOWx5a2diY1BGeEhraGw0WWNCb2hKcFByNFowTzVyd21uQzEv?=
 =?utf-8?B?S2FkTVN0YTNBRE9oU0VMMm0zekxkVU1JdVNHcis2ZldBeC9YczVteXI4TDlD?=
 =?utf-8?B?SE1GS3FGK2EwNU5DMGM2elFGZWtBcjMxWHhOdTRmK3JWOWhnSXVvcDl2SWs5?=
 =?utf-8?B?OWk2Y1d3cXVOL3V4cjEwOEFHcmVlWEpuWVV5NzBSSGR1VXFqM0pRdUlyallH?=
 =?utf-8?B?MkpkWFg3ZktZMExaS1I1cEo3dnNEUUo4QmNRMmMrbnoxRmEyRmE2OTZVbnor?=
 =?utf-8?Q?dPlIPy07fTtHEkOqlQbxR92mBKWQ30+hCOj0s?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f0663c12-d888-464d-14f2-08da333bf8e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 10:49:49.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1ws0V0SgthMCh7UXpDKR/6yJ/s+0ooHryWvcj4MgJJCeX7TatuOXO7J89+SjXO68bayWxVJo6abamtI1Crw7A41jgyZNUONBrsW9h6iyw4+iyHifEWz4eI+OT78M60LB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7447
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 10:50:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2931



On 5/11/22 12:41, Robert P. J. Day wrote:
> On Wed, 11 May 2022, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 5/11/22 12:28, Robert P. J. Day wrote:
>>>
>>>     was building a fresh ubuntu 22.04 build machine for OE/YP, starting
>>> with minimal install to see how much more i would have to add, and
>>> got (via sanity.bbclass) a missing module message based on:
>>>
>>> status.addresult('Your Python 3 is not a full install. Please install
>>> the module %s (see the Getting Started guide for further
>>> information).\n' % e.name)
>>>
>>>     note the reference to the "Getting Started guide", which does not
>>> seem to exist (anymore?). where *would* one go to resolve an error of
>>> the form "missing distutils.sysconfig" absent a Getting Started guide?
>>>
>>
>> I think this is what you're after?
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_ref-2Dmanual_system-2Drequirements.html&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=yPuNzagIy_whkBE_pem1x9YQx7w5lvQlVIoLNlaMimJyeWKCJdIPq9TjDyYGWrjs&s=24h3qNQNp2mMdaiqx5o7n3youEbYKRITx0hwOnd9Mdo&e=
>>
>> If so, please send a patch to update the error code to point to this
>> piece of documentation :)
> 
>    i *suspected* it was something like that, just wanted to make sure
> there was no "getting started" guide i'd managed to miss all this
> time.  will send patch to OE list.
> 

I think it *might* actually be 
https://docs.yoctoproject.org/dev-manual/start.html.

c.f.
https://git.yoctoproject.org/yocto-docs/commit/?id=028f8f7a1b93a023a99ffadb01b0da699b4081c2

Either way, it needs to be fixed :)

Cheers,
Quentin

