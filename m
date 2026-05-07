Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC3FCD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 09:11:14 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7786.1778145072737481706
 for <docs@lists.yoctoproject.org>;
 Thu, 07 May 2026 02:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JDU4HyFU;
 spf=pass (domain: cherry.de, ip: 52.101.69.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJMKd0OolSkDzkSuygBButITstw0CuDBtX63rtO1kHZX81/AVSVmrlvAIBcBYYnBr6F+8UoODvcx84Uigmm8+SZDQRynOlKaQcI0/WBZB7P2+s/+EDRPTlsWAw1OlK++c+9Tsa3O4SBnyVLqLg1EeyjVvfaAMFzEKZBMNhlJcnHxovDMolfqMQghbs1h4c1cbHabFM9uoazaNEvueenQS97DmPpPo5FQSpjiEJ3l2b9dYUu1Ad6xhPmNGsSDxUPwuOS77bGadZRmxjXiKRZ984stpgo8CiHuHYbddy84BkioHcc6Y00yI1uX1W8UaSeFsNVoAJWWsWCzVCAexMQu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w9bGN8Z8kXoKppixUbpnpud9KBLaNC0vQTi8NBRxUs=;
 b=TMbt2qWFx7H8xLfDcIB20u9mMmpdQL5X2bkJLV0HJkK75zLBmVUEdShYG6hQnjqTJG+ftu75xx/GOjc1iT7Z+KdICzFPu8SPTa/5Zf/D+FdYRky2UutkBGjqj3uSGfvLacwtZ8oIzpDUopznU0zWzdDbUtLUzLce03rwOYnpH73/l8iwDBMEmSzezrsH5uT2i2x1sRyRWFo0ISWYYYUdgEajXvIxYmsUWY15mw+u+tTHE1AMiD+R5TKHecvcEXA1mFAJ0AiUbmUVQ3PJQzjjvw/y7qoEXIeZlg0ybGgL/a3onLNSCPQIMWOQiKwQYqRVAz2oRtvolDCrMI/MH3n5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w9bGN8Z8kXoKppixUbpnpud9KBLaNC0vQTi8NBRxUs=;
 b=JDU4HyFUhkcizTDJK1P9GGzRApcE4eiVjABMMjDvctMwb5txfOIcyYPZlHGl5X0jpRMIHnbuX9AbhaOSG9cXI1Zb0MNTgVVIeIR91CdUHnFPq3S0TlJl9qdhATbHVUb7Gk18leRLKGmmNhdEBhrdYe/eNu7dkFRECaVgjvZPGao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI1PR04MB7168.eurprd04.prod.outlook.com (2603:10a6:800:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:11:08 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:11:08 +0000
Message-ID: <8c588fcc-ed3b-45ef-99dd-6a916c122228@cherry.de>
Date: Thu, 7 May 2026 11:11:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] Document shared state signing
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
 <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
 <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
 <DI41OUUEK11E.3GOUTLCIKCHUC@bootlin.com>
 <abcb5550-13d9-4873-9ff9-df76e55d7fb9@cherry.de>
 <DI4N955YCS67.3IN39HM7NOLNS@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DI4N955YCS67.3IN39HM7NOLNS@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI1PR04MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401b016-cbca-45aa-9cbf-08deac189367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OTWdZ8RmsZOkA34D7j3zy0B8H1wZizYXGnFZmf53Q1JqFn7ArX3ZKRhbtLUb1pp589iCOEN7vBa+8uwGlzZHM0Q/CuU+XLfZBoO7pL/ASNBa3SynmWCKyEGagCCV+89dCPqI046/GAws6IeElQQSTY331hxZpvgAqXV5L2m0LQsVTX6AwVXvaS3u+gBLSVhAnnD4e6CsHlOxi7e58OfTiFYSa0+lT+iSWAbAosVFMlN8SUshvlA9+lYH2ApAVE2/I73n1Df0cxnHQnSs88xyeHFMm3omU1mC792S8veuJRJRigEm5kTgv7io4+9dWGwFQyZQkj5VUDuGQ9kczH12FofLuoUSHO4zxTxaNp5MC99odv28eTDyrUQa2MRwv7a3mHkZtH4xO2kg+mSSeLaMHz4DegD/vOijyZVjx2Lt4AVyg/8INF4JVC/DahBS9g2wdDSlKNULIjgfbqGiwf9HudwvKFQ2fyt/SeTUt3jnjjRDBPl30SKEtmaqxxzlonhI16+/OXgZZDQCAS5nWNXqUgFixO3H9Tg0SP8DjGCVrnFiS3oSq8gvDnN5zMPGK3qKHBuynnEA+fQSf6RLFGyEZ+caYM2CfM7TNNOz/SVzk3OcGsR1gluZP0rgHZ1xp6s2iL3qU1IRXeqUOmEcMAVPPKc983QcxC4McixU/bts5tpxtpbmiGjXgX6y70yC3EVz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2ovQTlKaitNblJ6a3hwditLb0phMjR2TC9RSEVPV3YzKzd2WWsyT2NOOWIv?=
 =?utf-8?B?OFY0ZTVDL0hRVGEwTDA1WFVlUHI0aExuYlZGNXFGZDhIek5YVXp4VXJUaWtZ?=
 =?utf-8?B?dVYvcThNNjFrNFllUFNON3RzT09DNHZ5OFQxYys4Wm1OekQ1c1lJQXRqMDBP?=
 =?utf-8?B?MDlLbzcvL3AxazRiakVpTEZ6eHRPMnRRK3JFQlo0RE1KNWVjVERvZFZnR0tV?=
 =?utf-8?B?SGlCWXJZblBFQkx2YXhyRDhFSGlDSzNJbjlQZkVIVmNvWUhlVTRCNE1DQnJl?=
 =?utf-8?B?b0g5emdJTWFEZGR6Y1dBZDJ0SXJqU1Rya3F4MDNOSHYrbEo5MElsYjN4enFG?=
 =?utf-8?B?UzdKY2dualhFdnJZaTZlWTBXa2daNmREQXNjWFVhaVE4WlM5ZUMzdUxxdERO?=
 =?utf-8?B?SHVtb0xXOGsyTm5TUXdqbmNmL3NyU3VrRW9wblkyS0JTcHdxZm9TbWFvMmgx?=
 =?utf-8?B?ZzV6TEo5T09yU3RWL09ycTBxOGN1TEVJdmUxTEdmSjlzM3JlaW1veU15dm8w?=
 =?utf-8?B?c3dzVS93OWlNanNlQmdmN3FaV0EzT0NkR1E5SS9FUm1QUmNZRG9LSkY5VTBu?=
 =?utf-8?B?NTROZUc5Wm85S1RYQnF3WFpoZENLalMvb0VyV2p3WGhnYnVSelNEMEVUUE1n?=
 =?utf-8?B?UzVLamJxVlNDczUrZWhDc0RPSnlnREtqOEpySlFpZnBieGxYc1o0cFJFcG9S?=
 =?utf-8?B?V0djZGs2RzY5TTBGdEJZcXE5YUhVL1lVU3RpMHYweFQ1SWVuYmlBdzRJcFRB?=
 =?utf-8?B?dVZobG11WGFTMnZiVm9GUCtwcDdzYTVBcjN2aTIrRW5uMmxkdXROcXREOWcz?=
 =?utf-8?B?dktsSGUzNGczVmNubXY3MlhPKzB1Nml4d2hHUXdlNGRwMWo4UmhBOENUUTZl?=
 =?utf-8?B?SkJqbHVuZkdDbXhKU0xUZVhlazV5OGZGdFd1UGRSZUQ1OFJ2Y09oeW00WlBO?=
 =?utf-8?B?dWFiazRBMGtNUkFUOEtBeXlYUWRydW9rc2Y0WkhQTXhvUzJlSEI2Ty9Da0Fv?=
 =?utf-8?B?RnVTY2U2bWQzN2NxcnNSR0kzYVREb3dpV0Nqc2xmcnlMYU03Tk5jU1dWMU5h?=
 =?utf-8?B?M3NTYzZvRWJhM2NHYkZhQU5kcUlCRkNIVG1hd0xCNW5tdURhQWM1a1d3dklS?=
 =?utf-8?B?a3UyQVRqNHd1ODJPK3Y5T0VKNkpSR2RpaFp0NzBnc0htK3JJZVcvM015NG5p?=
 =?utf-8?B?Sm1IU0NDSERXL0NPek5zd1NoYXRNRXVZcjhKKy9yNzVTb2lrKzNrVFlDQXIw?=
 =?utf-8?B?RTF1RVB3MWtMSStDYzJXaDFOeWprRlJ2aXVTeW9kQnVxdHlUeVNzQzg3cGRt?=
 =?utf-8?B?eTRNOExKVXlLODN6UDBrdy9IeEpqMXgwd3E4cTM5MDFXNEFwVWZybUh6bHRq?=
 =?utf-8?B?djhaQXFPWm01YzBhcld2U3dSTHBsTWN2UFVzZTlDaVpURXdmQzl1WTlzTDR0?=
 =?utf-8?B?RTEvREx1c2h3YmZqb3NDZHNEZFcva0F2bTNGa0VQREkyMDNrWjFhQ1A1ZUtj?=
 =?utf-8?B?T2VqeWl6dGhycVp1YVJTQldUb3dpelNXcUpGZ1FmWWZvOXFXY1JNZ1Fnc3Vq?=
 =?utf-8?B?WXhvTm95M281Tkt6dlRGczJpcEhuM3hwaHFGYnFGOUJCOWlzK0N6Y3hweGlj?=
 =?utf-8?B?NTlBWmhFMXZYM0JjdHUxa0xRTXFicHNxNE9rRHZ5Y2FzSnJKbXJpb3N3UmpH?=
 =?utf-8?B?US9FSzlQYVBXZWJRM3FvZVpvQzRSeU5lV2NadmFCL0pnL3EvbmpQVHZOVHNv?=
 =?utf-8?B?MTZCVmIvMStZZy90Rko3dnI3d1BTT3NkNzFIbkUyejJ5QUt0d2ovUXo4SElk?=
 =?utf-8?B?VE1OUmRpdEsrdlk2eXRCaVBVVnNpdFZDMU81VnZ3VTE2ajlqQURoTlRWeC9V?=
 =?utf-8?B?d1pYcmgzVzRnT2w0Q3pCS0VFbGpWa2prZTB6NHE5TGdTL21QQ2hIbDhrZTdy?=
 =?utf-8?B?aGt6NHVKeXF1QzRuQjVsTGRpRWlpRGVKSE5XSUdXWnNxZGxvSWtMTTVZZHlM?=
 =?utf-8?B?bTVYUEY0ZnJrdGgvaEtuVC9ENDNGTzZQTDVxV29tcllTYSthWWlQNnRnUjJi?=
 =?utf-8?B?RTFVaTlxeUllbzVjdHN1Q3VoV2RYZkZxRDBodktnTGJmZWd2RHg4R0l5MVBR?=
 =?utf-8?B?WWtWWWpCK0owdU1keGZwQmZjVWtNUjlIZ0t6YnY1UityOGNZK1FiQ0ZkeGJL?=
 =?utf-8?B?L0dCNHRDVjFJeWtLdkZORVY0M2o0V01maUszbWhyWWd4cVRvSFdlMGNKV2Zs?=
 =?utf-8?B?RjlCVXU4RHNORkx1dmd1QXJ4eVkxOWhTSFMvNVRQcWswUjNxckpPdVRmbG1r?=
 =?utf-8?B?Y3VXUE5aOE1jclpJalJvdHl4Ni9JaWQzaS94STJOTERYbzl5blpNUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401b016-cbca-45aa-9cbf-08deac189367
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:11:08.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaQ5b0SKSspFYTh0Tmh13DUGX+Qc5uVcCLynniGuCw1m6Xt5eOdCJha+v+TPywDUOvRFtDgZ3CbrOE6xqvSAVKS6mr8db0vAUUvpQyiStrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7168
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 May 2026 09:11:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9396

Hi Antonin,

On 4/28/26 10:27 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Apr 27, 2026 at 6:44 PM CEST, Quentin Schulz wrote:
> [...]
>>
>>>> +            return True
>>>>
>>>>             import re
>>>>             goodsigs = []
>>>> @@ -145,6 +148,7 @@ class LocalSigner(object):
>>>>
>>>>             for sig in valid_sigs.split():
>>>>                 if sig in goodsigs:
>>>> +                bb.note("Signature file %s successfully verified with key %s" % (sig_file, sig))
>>>>                     return True
>>>>             if len(goodsigs):
>>>>                 bb.warn('No accepted signatures found. Good signatures
>>>> found: %s.' % ' '.join(goodsigs))
>>>>
>>>>
>>>> ? I think we may have a few people resisting this as I'm guessing this
>>>> is on the hot path so adding messages isn't the best (even if disabled
>>>> most of the time).
>>>
>>> I see what you mean. You might be a bit more convincing by passing them through
>>> bb.debug?
>>>
>>
>> Sure, I randomly picked bb.note() but anything will do (though, does it
>> appear in the logs, which is what we're after after all?). Even
>> bb.debug() writes to the mainlogger, so I'm assuming there's *some* cost
>> even if it's not printed. Did you try? Does it work? (Because I just
>> wrote this without even running bitbake with it :D)
> 
> I tested this and this works fine. The messages will be printed when passing -v
> to bitbake (verbose), so I guess bb.note is fine.
> 
> Maybe I'd re-organize a bit and do:
> 
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ede6186c84f..9024b349ef2 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -130,10 +130,6 @@ class LocalSigner(object):
>   
>           cmd += [sig_file]
>           status = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> -        # Valid if any key matches if unspecified
> -        if not valid_sigs:
> -            ret = False if status.returncode else True
> -            return ret
>   
>           import re
>           goodsigs = []
> @@ -143,8 +139,18 @@ class LocalSigner(object):
>               if s:
>                   goodsigs += [s.group(1)]
>   
> +        # Valid if any key matches if unspecified
> +        if not valid_sigs:
> +            if status.returncode:
> +                return False
> +
> +            bb.note("Signature file %s successfully verified with key(s): %s" %
> +                    (sig_file, goodsigs))

We probably want ", ".join(goodsigs) here?

> +            return True
> +
>           for sig in valid_sigs.split():
>               if sig in goodsigs:
> +                bb.note("Signature file %s successfully verified with key %s" % (sig_file, sig))
>                   return True
>           if len(goodsigs):
>               bb.warn('No accepted signatures found. Good signatures found: %s.' % ' '.join(goodsigs))
> 
> To show which key on the host verified our file. What do you think?
> 

Sounds good to me, but we probably want to split that in at least two steps?

- print matching keys whenever none are required,
- print good signature when a key is required,

Since you already have everything set up for testing this and I don't, 
do you mind sending the patches?

I'm wondering if "any key will do" is a security best-practice or if we 
should warn in that setup? (probably not in the hot path here though :) ).

Cheers,
Quentin

