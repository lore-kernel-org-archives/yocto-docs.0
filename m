Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9E9C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:30:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.183.1784561409062254160
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 08:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oHlejMQT;
 spf=pass (domain: cherry.de, ip: 52.101.69.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbocxAETKblA/H51BlRSCr6f8xksteKsTIYh633OZhYXs37HRZC8A4HF1GTb+V57Rjq+QKv1WjKA551UwoP030eas7xOq+kYm3Z/t0dZRzusya6g03lm9ViPTkNK2It5UKSa+RNPkpByyj6XeWfByOSrAsuwARv/zlDjcj6IGFDbVyB38Jq+0HgP66IkHgyfXgiSL3t4HgLyDhv7YevO/10aG81o4lioinFdKL8H8nT/MNmp9tGeWIyFajj+aTn8jzs5MQRnNy8hg9i1ms2o0uoCKPw1GHvIMRQTcd6Vy20sNQPuqz3QS8dgcVrWd4ksICnWkdHyQ0rX8TvEYsSiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnB0douU1GnfmXZinIk8GCVSlVpmuFtdxoC/vjZbTL0=;
 b=vhQjA98nKrZono7/2wbXTFhnV0PkdCGj2ORkI9ZpIf92v/nI1JqQoo2UbSegrG8rwvJKGpdaK7LIYfh09D79v4SW938s9tIgr4NW+1YhuH+w3the8QPC1btJ92aBqDMQIaQnUE2WQ+apnDHL3DTYzUK3ac3C25Z6avDywREBYz73wqr9syoSkXK6VhXZOxeJzUOUrH+CWGfV8ODsAYrTcosLza7pfdAljNJeMhhiN0krsbKnSLhITQTki6mA5a6QlmrGxsFegrwoGS9fEH4sFgLGgZQcKz1ShrlxqqJf2vre/goegZEpvd83CghIvHO7+dmmx+EIuSmzoZk6CcZvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnB0douU1GnfmXZinIk8GCVSlVpmuFtdxoC/vjZbTL0=;
 b=oHlejMQTqLW680r0n+5LsgPDT4cz9d0BTFPsaQmmHkaTIMdSNqcB7j5CWCRFAbPGe1sUQ7Kp7jPtx9DQ1jay6kKbyrzoAlXeisDfDZkM1pwnFQ6pmxNWOIK83lgCNAbdJhLawFfqKfYchPp76mMZyUL/WZC2e2e5i0omq6eAXYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6917.eurprd04.prod.outlook.com (2603:10a6:20b:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:30:04 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:30:04 +0000
Message-ID: <cffc9ffc-568a-413f-8f3b-6c983697bb7a@cherry.de>
Date: Mon, 20 Jul 2026 17:30:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: document variable and task for kernel
 version check
To: rpjday@crashcourse.ca, antonin.godard@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <57f7256c-e8b5-c425-0fb8-7699b0cbdb5d@crashcourse.ca>
 <DJOZQ24ZS3L3.BNPZLMDSAVOC@bootlin.com>
 <f87fac25-8ce9-0e32-8785-710f630d02a1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f87fac25-8ce9-0e32-8785-710f630d02a1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::25) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 77130018-e0ee-4ee4-df50-08dee673c559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: 
	JGAK/1XsmzePD78uDiBozNLX0NQ+U4FUJCB5YP9uvtZymnn7NDRmHVx/4dilAjosDiysx1TSHbVhThXgDuFAvooqry7eSo5rGn6ihDw1IYaUxD+MgS3TmldeOjhx3AeymPDgnrNRBvIu1PhZ1GeV5WomtoYUlr9yl67l/OV6nym4Kld9VWKzasQMrNqeRpm9Ta6M1rBOJA597tkEg4XKAGmo2ID+/sSbdkzw3oYRJ8EW/JAHPcIr8U6NO8YZoAn/2ph9T0M28aksOy7i/2Z+uEbsVQ83kNIcfKz9cLlSCa9q9RQzE1zxf2EmOIRbA4grEhk/Pixog7uApcMy5s3qaL2jyzWqcoN8PldmM6J2pSbC/6PKe5UiIGOdbcmr+LYdkDGzvflXtjzSaIRkyyRRmfsumnJyKeH5UqN4HBEvUaGuR3S0v5Fnvvi5pUhz4AUss1ccp+WmkFN6cXrwN/Zrw1ZoLl9mZwnEoPddgT7WazwZ9lQAiUgQrVDn/hKyiB/6eCyCoH6vAFDng2O6ZuXet8QkNDSbqVIFfD2AGpPi2WuvD6ENQNO98IBmeubzuY+R9/JRjxIhISHsaCe+CjcXfomvxwLdAoQRP+NIc4qlt5WcNNrJ/1VFzkzJXHlarMmuY7S17V6tGG6GOJsj5NjX+ec22Z9wJwW+LjO6OVNn2J4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEp0RXRKeFZ1R3M4M0oxZnR4WUJBcUNxdkt2NVN5RE9xUjZoNkI1RWV0TXF3?=
 =?utf-8?B?UXhYNTFjZ3dZU2pZRVREZ21HeGFxL2EyY2R5amJVOVVZMEVjSjVzeTZzWmla?=
 =?utf-8?B?cDNoR09PWGUrc0JRbVFtRlJ3Y2RnYkRCN0ZTeVJ2c3Y4amoxL3B6bVcvY2x6?=
 =?utf-8?B?VXk0S0t2WUNHWElXZmxsNklGeHczcElYMUZZZmpObHN0K3p1dUFGTkVBQitT?=
 =?utf-8?B?TkY2VG56WnVuY2krRHZhQVZoUFpQTk1NSy9FMHNVbGQwdnkyOFE3amxuTUNx?=
 =?utf-8?B?LzRvcHgxT3pyK29KT2tqcDVEbkl6aVZwbmd0MmFZdHNKR2c1dFU0Y3daMllD?=
 =?utf-8?B?SDNHOWhNM0dJQytvWmZOMG4yUlhpMGRlU1gwaEJyR1Zlb3JXQzlsYll4UDBX?=
 =?utf-8?B?MWFpdXVoS1Q2ZDFITjdGbGw0MEo0cHQzNnQya0ZxQTFDS2VCODA5TUg5emNs?=
 =?utf-8?B?djVGVGU5YUFLRUMvV3N0bWIwSXE2UjFaR3FMaE9sS2Znbmlrb0MxU0tRaXRq?=
 =?utf-8?B?NG11Nkk4VUJ6dVZGYlJqWTl0Um5xT1RIVUhNc3liL0psSys2eEJXSElQTElY?=
 =?utf-8?B?ajAwdWxZU1FPZjZEMkh2bnJiTkIwSlpzUGpTdzM2M1dWS05xOUhhWExTb2RN?=
 =?utf-8?B?WTJ0UHhZcmtpeFpqV2ZLRTg5bUo3WFNQaUlBd045OGVsRStKdGtyTU5yYm9h?=
 =?utf-8?B?dHllNHB4eFU0QVRuRU5UUytNWXdqSHFVN2xGYTNMMmNwQlVlWTlGSFcrMlVI?=
 =?utf-8?B?VThZaVlTSFpERjlHWTNERlZhUlhSNXQvaHpJbSs0dllCQzJvU09EQnR3Qklt?=
 =?utf-8?B?bjFGRWEzSitKdlFCL2s1eGlrWE9UY2gydW5kc1hqVGJsNnc2MFY0M2hhNE1K?=
 =?utf-8?B?V0FmQkNaSmh6aytjbEFkREpCeW9iWGJSWE1zWFdMSnJqSTgxcVB5blRncFZx?=
 =?utf-8?B?SGRZd1NhMlJzL2NSdm0yODgwM09XQXBkbkZac3VjQ2tVVnB2RFVwY0g5MHBF?=
 =?utf-8?B?N21ZODNXejBFWUJDTTRJSzFtU3RiTnRIS3dGV0J4dG45UXJGYXJuVWpEeisx?=
 =?utf-8?B?aVplUzUzUDdKMEZNTlZqdzBhTHJqTllVM3NQU2d4NTVrZmxZYzc2WFp5SEFo?=
 =?utf-8?B?eUdRNzliWXVVSTJiQWNzZXdoM2pIUzVCbXBNZytkMjBHdFFleG1qSXVMN281?=
 =?utf-8?B?RG0vb2dFVzdpc2JWTG1LZWFEdGxSTE1qelNUZDlkUVZWanpNNEl6U09GT0lR?=
 =?utf-8?B?S3NzM2d4RWNkNE94K1NyQ3VwVW1iUTNYTUNZMGNIWFAzaWdqV3Q0Wmlqelp5?=
 =?utf-8?B?SHplVFRaN3ZaVERRbFdOVU9yRVJ2MVBub09GMVBsVGVyYndndVZCL1BDbFZV?=
 =?utf-8?B?NEVXZ2RnZGxJczhVMHEvWFJmRjlmLzJuQWUxQnZhcDhWK2NQMUMxMEJHTWRB?=
 =?utf-8?B?WXZtdGdnaEsrZkdQS1FqTVNyNE1IV3pPa21icjllcEJVZVhCUndITkFobWIx?=
 =?utf-8?B?VFhLZFNXekxUMG5ZQ1crZktvZWNQL0xoMjJXSUZnZTI2bnpjNDV6VXI2Znpu?=
 =?utf-8?B?RzVGNDBzNDIyb2NDU3gxN3RNN3pTRVRvUDl4K3h3ZlllZ0hoU2R4NjhGaEdo?=
 =?utf-8?B?MjlJMDlUVU1GcGVjUVUzYmR2bi9pcEtpc25CS2lYZklDZm1KQ2NIM1B6dUsw?=
 =?utf-8?B?em9BNSt2aC85L3lzUkJuL2pzOFl3M2JTZ3BPWjhXS0FDOTIzK0pKQVBxdXcw?=
 =?utf-8?B?Tktmd3g4UkxCaFRuV1A5eVcrSVFOc0J5anNRSExLOTVoSjV5WHRJcDU0S1ZD?=
 =?utf-8?B?enpoZDR4WE1HdDJqM0pnUFNzaUFDSExnQWFQVEVEQzZjZDM5b29ndThNSFdI?=
 =?utf-8?B?M055LzBsVUMzQmYvOVpJRS9GaUgydGVLNjdvenhyMVlTODB2YTRDUXAycWpC?=
 =?utf-8?B?L2lqTlB4eC91c3BISDYyTmMrQitQVXhpc1RRMlQwRG5pdkpVSSt4Z1VjUUdV?=
 =?utf-8?B?eWhzejBRa2g4UlRqcnBXZk9xSEZuVlhBWjN1eEthMzBWczFFRGxZT3FKNkYr?=
 =?utf-8?B?Q3pLYys3RVFhM1Q4Lzc1ejRDaittTFQxQ2hWMkFPQTI0cks1bHRNc2pvd0I4?=
 =?utf-8?B?M1owTzNSRVlza2RaNUNjQk1yaW9QKytMamE5cU0vSFRFb1ZJdE5UV1Vwd05w?=
 =?utf-8?B?dTkzQjVxYXA2RUhEeEVPRmlZVEZtaWhqZWtwOWMwSlJ4bEJLd0ZZQWNoem5L?=
 =?utf-8?B?Vkd2QmZSc3VLa3VGQ0dZeTlvUUovNGtQUDl2ekxrV2pvdE9pTnpjbDhaTzRk?=
 =?utf-8?B?Rk9yTzZqMEhPYmpESXJHbEtPVWtlVXFhemlDQmxWMy94RlJyLzIvdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77130018-e0ee-4ee4-df50-08dee673c559
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:30:04.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xm4ZbzQkNy56U3naIloHKxrOvNv7Ep2rATgsmxRqvKS7mFJqOWfNEPgHjatsGMabwwGxjGjOVUVpv7lLuPpBAM+e57xBIOgZlY5SxDZYXZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 15:30:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10096

Hi,

On 7/3/26 4:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Fri, 3 Jul 2026, Antonin Godard via lists.yoctoproject.org wrote:
> 
>> Hi,
>>
>> On Fri Jul 3, 2026 at 3:25 PM CEST, Robert P. J. Day wrote:
>>>
>>> Add the associated variable and task for kernel version checking:
>>>
>>>    - do_kernel_version_sanity_check()
>>>    - KERNEL_VERSION_SANITY_SKIP
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
>>> index e1db2d5ed..5744d47dc 100644
>>> --- a/documentation/ref-manual/tasks.rst
>>> +++ b/documentation/ref-manual/tasks.rst
>>> @@ -787,6 +787,14 @@ which can then be applied by subsequent tasks such as
>>>   :ref:`ref-tasks-patch` and
>>>   :ref:`ref-tasks-kernel_configme`.
>>>
>>> +.. _ref-tasks-kernel_version_sanity_check:
>>> +
>>> +``do_kernel_version_sanity_check``
>>> +----------------------------------
>>> +
>>> +Validate the version of the kernel
>>
>> This doesn't explain what this task does.
> 
>    Have you *seen* the RE/pattern checking in that task? I'm open to a
> meaningful one-line descriptor.
> 

It makes sure that the PV of the kernel recipe matches the value stored 
in the root Makefile in the kernel sources (SUBLEVEL may be ignored if 0).

This task also only exists if the kernel.bbclass is inherited, so this 
needs to be made explicit in the task description. And it is only called 
if kernel-yocto.bbclass is inherited, otherwise it is simply a function 
(it is not added in the task tree in kernel.bbclass).

Also, why would you want to disable the version sanity check... I'm not 
sure. I guess you could say something along the lines of "may be used 
for a rolling version of the kernel that is often rebased, e.g. 
linux-yocto-dev. This should typically not be set to 1 as it may mislead 
the user as to which version of the kernel is actually being built or 
installed."

Cheers,
Quentin

