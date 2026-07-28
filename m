Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E5DC54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:11:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7690.1785229861960392729
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N+Uxfm58;
 spf=pass (domain: cherry.de, ip: 52.101.84.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9X07XNulx7UA8wYOzhu1Ns/+U5f7D09+ZGUgJLWPm/HlJ4kXzhFZM8AKqpE3vScmqkkyg+F1M9dkWSIYQLJJQdKfkE1RjvTwthcQ8q8+vYuGjT6Hc6wmnIENm4of51uYIT1x4oKJPKccgvfYdO5Gi2zhqQznoDCVk3eVpWp9Xi+AXOIwyHTdOeOC0PdX7bMrKfbFwtxldzw2JzMsAANNa+6amFg21PHCozq+8hUkqdwwWpTu8Bzp6EsBCUxKulXIv+S2jxpqBzFJvcIA0TpabWoYMNoHhramsU9BViLquDOXBhcf7V8PEHUlCSZ8lAPpkVToYkL87kW8t50VHrXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhq3OCmwnqChsnyIppFXQTPRR/knemqgqPXAnvYkCJg=;
 b=DsqaE/W+o+O5+CtPqf/XESn8xCeh74E3E7lyg0hSxM2UbSzGj/x0yR/xFrtEYRV4O8+3P4vZVfTpAXRMGZ0Q4rRn2zM5wU5mZ54FpOMRCFYz4CErvMKUwXhwnZzDCyCEY8Thuuz8U/n4nXLcH1GLN4S44Vj7zAXCyFPb9G3RzLkFVoWVFgzSrgUWZaOR5Z1sxCgrD1jzfwMkgoQ8cvX0/wvjR2XieLsOd7jHQC8ogkD2GKIsiVpIGhEOE4fL4NGRshIQvoXQDy3cJvPXIxlvBrb8Fop/KT7A7yQai/CmU8LRMbMcegGuPT7mSI54f53vmgNdDsId7kYifK7Eo18CmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qhq3OCmwnqChsnyIppFXQTPRR/knemqgqPXAnvYkCJg=;
 b=N+Uxfm58u7p4/duAcwCFXLn+UnK0wa0KTOW7vTt7agUSWomfc+BvkhhXXF2HtKEC9I5HcO/U4H1rrl2jUXKmH9zjVQF7ic2O99t/o31ag/IQs5XbCbkfQs2uhuxMfGTJw/AKhApwbwtlvl5ab/ZnRB4LXtGhL0NNfMohRpxnzEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:10:43 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 09:10:43 +0000
Message-ID: <ad98101b-a5b4-4631-b6f5-3c83267373ce@cherry.de>
Date: Tue, 28 Jul 2026 11:10:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/4] tools: add gen-doc-links to generate
 documentation link flags
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
 <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
 <9b51a647-76c1-4bbf-b4fe-c9fc57109bc7@cherry.de>
 <DK6UEDV65R3Y.2HPH1DCKA1Z2V@bootlin.com>
 <fecc23f0-65d3-4621-8969-1ea92f24e9f2@cherry.de>
 <DKA2J31USQ4N.S0DEGRSSMX8W@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKA2J31USQ4N.S0DEGRSSMX8W@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::8) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: f634e914-b668-443f-a17e-08deec881a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	bVbhhtjZPONJguEN9XXmXR1fu9ZGyQ3KEwBK6d6sxDtkrjUF6xT2XX80WA77aPlECUoy14LaJ+YwkpePd5EwPkusVbIbF7tz94710vni+tmzfylWzwVD4ndNo7JEnyRs/Zt7AlagIGeDj4qO9sNqPYCMEz3nYnRDynx7XhX73LjhpvR6vcdiK3I7lgiDT6qbdNq0IhDkOpj/uYWwPp43CdGDsdYpIazOiiEJM6LcLU6+H0jCcWxMhj3b6+nAXE+SWIfGxvBmitUKRsSq8iXc9t1/S5nsaf1A4nPIHdwQe+o3NvlWx8DVYJ6dDtpSYTt+nTyHsy8p8hNDISjm29e3w4JOJEoG0FqvUH6hM94Sfsf5B6SWGuJR4rqbIyHCOkRHIRMU4VzsG4+S4DVLCb1CteHCE/4DVjdsmyuYTjQ/kzdJd39a5OK7K8HZBgaC/w9n6xxkMxH7GTcecW/hlzEtSwKSVZcmhrVaNQlPYQ+xOcdQlmhOXWgiFCx9yon4E3o6PM6RpW/j1jCnxRIYnLwE462hWpTNsLDZbEm3N62R7uoMMUZHxdv0jwF9R8TxbGzZbQVt5flT5sm5ecTSleFZLK09aePTmH95Qcex/s6qphxLEs7gf04MWi317JuTOzXebMrMPFgnq3DaE9qTf4/grohZwMkUJMMCrl+UKO0n3bM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1BEcHNsdjRhQW51YmkxMkVFSVQxU2EzK2N4c3pGOVZRdGxxL0NyenJYM0Vi?=
 =?utf-8?B?WmR3YjU5VzY2c2laaWZhbXFiY3kyRmZkSWRvSW01K0hadXB3MVA3WGwvUW9a?=
 =?utf-8?B?QzRwL3hNRFJDaVc5bFE3R3JzdDh0R0txUlFnbTlnaC9mdFFmaXZFTXJBUGYy?=
 =?utf-8?B?eUZQOHJRWk1zQU1MOUdYdEhvcEQ0N3hGSEZQcmU2UHZqZk1HdEdtdFdLY1Ji?=
 =?utf-8?B?bC9GUjZBTUdRQ0JiRUd4cnpCU21rT0I4eTF5c0NBWko5eWRjcUkrSlNOS21y?=
 =?utf-8?B?N2N3dFJ0S2c1dU5YU1JMampDdzNOOXRrRjMyT2pqTVpxTE1Ma3BXcS94SlJ6?=
 =?utf-8?B?NVpCTlRGdFdPRlM5WVRXUThramtrNUlwV2Z2czV6QWZJOU9yb2xYSWZBYXNr?=
 =?utf-8?B?SC9DTzM3d3BoRW5LRzRVU0lKdlYzUWs1cW1QSy8xMUZkTWxCSzM1TWpoMWph?=
 =?utf-8?B?QkRWYVErMHpDaHZLeXowS21pY0pITW9DTndUdTYyTEF6UTlRRGlSekJUWEt1?=
 =?utf-8?B?L21zUnZsa0ZPblZkakNRT2thd2x5eU1tcTM5d2N3Uk9LdW1RQlExT0lpREtZ?=
 =?utf-8?B?eFdYdzVJbEJCS3VCcStuNTAwNUZ4bGNjK2M0TVlMd0NsQlNaRlpGMUw3aS9a?=
 =?utf-8?B?bU56NXlveTRDU2VvWnhYdEtnWTI2czZLY2RoUTNWdzgvVkZINENCY0o1NmdL?=
 =?utf-8?B?S3FYWk5uWGd2aVl3cmQyUDErVXIrSWxGQlZ4UHdadUlLYVNHZG5VcG1Fa1V2?=
 =?utf-8?B?OFVDc0NUMmgwa1VwWUg0czkzREYzYVREdHpIUFhiQ0o3Q1QwTFI3UWMxMW5P?=
 =?utf-8?B?VWFRKytXOWtoTys1cDRidW1OOUZVM2xsNDR4TkRkMjQxZ1hReFdLNVJIZ2dy?=
 =?utf-8?B?cE9kaktYTWhXRGRjL0xsUzh3bmNhVVJQNm1sazY0ME5JekV4YVB3QWUvYzRO?=
 =?utf-8?B?SENUVHcyVi9ac3BXTFcySGwxRjlCME1mVnp4dGVUYlBpTlY4UUJza3hHeXBH?=
 =?utf-8?B?bjZDWEkvMjR0azNSNTA3QXZYSzRqWVZsY0tmdXcxWS83S05LOFhJNTJBeXVX?=
 =?utf-8?B?VVpyN0R1elJSYnVLdkJSN0R3cDF5djRMZ0VQVlkzSm5rbm1vZnpVZkc4UUtG?=
 =?utf-8?B?M1lvaXZld0tYdmoyaGx1MmpDR2hiVTVkTkUyc29DYStNdU8vWHBoelJPbVAv?=
 =?utf-8?B?QTJjNlBMOCs1enFoK0tLOHFaaytXRnowUTJpWUphZzZzb0ttTE9XRXFvVUlB?=
 =?utf-8?B?UjUwQzVGUDNkMGZGZTJtbTg2U0dTTmRNdmFBMnhXM3ZTamgvYkp6N29DVy9Z?=
 =?utf-8?B?TGJGdzQrSXNUZTJuNExjdWt0K2F2RERYL1RhcEN1Z0FsdFRjSHhZS2xOWWg1?=
 =?utf-8?B?anFrQ2ltS1VxQmNueVdiQTQyMWRsU1JUKzhvaDcxRVE1VzN6V1ZiNW14ZjRx?=
 =?utf-8?B?dnVHMFNZeS9FYkU4dzBQczR4MGFQSzFaSGUrV1lQZ0ZXamNoK2FtRDkyQ0tw?=
 =?utf-8?B?Yng3cUtDSFNZRTR0OGlUakFRRnhNYmt1SFlCV2tGb0dXS2xWbjlsTlR5WHhU?=
 =?utf-8?B?WStLdFE2OUZ6cXlCOTBNUmZsbzQ4eG5TOUdDS2pJSms1QkJIN0U0WXkveVQv?=
 =?utf-8?B?UjltVnZNazNFK1FNWlUzNHk0bVJkSktkKzZvdXRNa3o2RG96SWlCTDlFQVA5?=
 =?utf-8?B?SUdxSnJVVklvQjdSeHRIWjB1cmJlVm8rK2d5K29USG1lZ2p4NllYQkFldlY4?=
 =?utf-8?B?RUt1QmFvaVYyVmhoRHJmZGtaaXZ4Y1dnUGp5TmorOCt5TnhBL1AvNTQwelc2?=
 =?utf-8?B?MHlPWXhvUHd1THRXQUtpTnQ2bTVjWEgycVZxUXJpb2xtNEtXRHJRWXQ3QkRI?=
 =?utf-8?B?MjA0amVTZThlb04wNFcvQU1CWTU1OE0zVTZzTXVYYWl1cTFyWWdZN3N0TSsx?=
 =?utf-8?B?Zy9XdFBOazQ5bHdVUGJud3NsVGRzaWZTVDVrQ2t3eVI0TE5QWWhROU9pWS9v?=
 =?utf-8?B?cVVMRUtOTWNIWi9XQlRzb0svODlBVmx0MGQzOUFTSExFRDdaZ1IxNEZOelZG?=
 =?utf-8?B?cXRPclJMV1BDRVJMTTJJazRCNDVpKzMza3BqWVlRRGM1N1lRdDhXcXAzaVpC?=
 =?utf-8?B?MGNLM29nOGhDclRQVm5hZHgzNVdTRm4zY2NOUEJlMzV0M3F3SmRLRzZCZDR1?=
 =?utf-8?B?YjFRdG4wVFpGaDQ2dG5zaHQ5amltTEJBaUlsZWpZZ3ZNUlZheERKRVIvWHBL?=
 =?utf-8?B?TG1XQmNqdlkybDhUUVBrRmFKOUJjZTNMVWpRcVZpKzFxN01hUXFZQ1FWVk5t?=
 =?utf-8?B?TlBXTlJOZ3l4L2I1NjIvMHFwQ2dqZ0ExcHVrbDdPWkdSRU1HWU82QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f634e914-b668-443f-a17e-08deec881a14
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:10:43.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD2NdifWE7aKC4zUqKQ05DxYJZivwOSr3yvMJQdvEwexVEj1FYKfptULWm4U09NH+C+1LPgEW46PzXSGmimbsf3dSDF0g3S4qupI8BzAOGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:11:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10171

Hi Antonin,

On 7/28/26 10:40 AM, Antonin Godard wrote:
> Hi,
> 
> On Fri Jul 24, 2026 at 6:27 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 7/24/26 3:40 PM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Mon Jul 20, 2026 at 6:39 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>>> Hi Antonin,
>>>>
>>>> On 7/16/26 2:18 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> [...]
>>>>> +def main():
>>>>> +    args = parse_arguments()
>>>>> +
>>>>> +    yocto_docs_dict = {}
>>>>> +
>>>>> +    if not args.yocto_docs_inv.exists():
>>>>> +        print(f"yocto-docs inventory not found at {args.yocto_docs_inv}, "
>>>>> +              "use the --yocto-docs-inv option or set YOCTO_DOCS_INV_PATH "
>>>>> +              "in your environment")
>>>>> +        sys.exit(0)
>>>>> +
>>>>> +    if not args.bitbake_inv.exists():
>>>>> +        print(f"bitbake inventory not found at {args.yocto_docs_inv}, "
>>>>> +              "use the --bitbake-inv option or set BITBAKE_INV_PATH "
>>>>> +              "in your environment")
>>>>> +        sys.exit(0)
>>>>
>>>> Don't you want to sys.exit(1) here (and above) instead to show the user
>>>> this is an error?
>>>
>>> I did not want to block creating a commit because the docs wasn't built.
>>> I looked a bit at it and pre-commit does not have a special error code that
>>> could signify a SKIP.
>>>
>>
>> Mmmmm... Any chance this can be configurable? I'm thinking people may
>> want to run this script outside of pre-commit. Maybe via a parameter you
>> pass to pre-commit for example, or via an environment variable that is
>> set in pre-commit?
> 
> Actually an argument like --no-exit-code which is passed only from the
> pre-commit configuration file might do the trick, I'll see what I can do.
> 

Exactly what I had in my mind with my first suggestion, just had it 
poorly worded :) So we're thinking the same thing!

Cheers,
Quentin

