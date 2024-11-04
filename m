Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC42D132D0
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:06:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web10.58249.1730729198951472862
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 06:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XqGABSiP;
 spf=pass (domain: cherry.de, ip: 40.107.21.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGWrE9eadfA55z/KATyGKDvRZBEiocWVKRlXCmQFoz5pQCiqcEkwdfs56rRvLcANi3w4T2JeBad7Vu/RtuVnKej4HysUV6nDD+GVp0G4yxkBCCTLdXBDCzS9AqbwAcajXArI24o+6Tf6Iz5y7MVMPVO+e0SUyJ8Ck4qS55tJybBRr5zCaUPbX2svX1oEqJk/bl5ZVRGYBUYRTzjH8v18NBuCmKNssQdK8ajiRPferqPNSU7YaROaYDMXGTnzMU4j+GDZhhn0DYB+NGyUC5aFotQgH+k8njwV40p6/AxV0anYw7z/9WgGwDsd5gAM1R4hfXXVWDnVR1Z/CTa61L193w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pytu4VYVtJVmjuQDWWt1o7y4xD79fClNlStWZAfjS1g=;
 b=pUdjnj4awp5IBfaMt4L0WSavbBfNS7pbJPLH4gjudNYy1jvspQRWAPYw+9oP4f1G9F0MimRrUaay4lEZgz/XHxmIaajXXvMCp5EKwGTcT/pUvOBQN5uehHAwZjtvcdTnMSyn6OGsokQF0EH+85fEn5m27+o18q3XrTDzpYFkoyXIsQUHDMqRTl6EsjkN6p755wB2xiihqK+h+YDRf11hpedp2XCvkzipIk0WGWwKpDj1DkZrmCo/5EwDmNEnL1wPfQCWDO0qwokdzriF/7/R/A/a46/iJEc7PvOFBBa0Kx5BXI/ibW73PrWiIlSSbRYnMWilgY7guJ7uOCTE4qkApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pytu4VYVtJVmjuQDWWt1o7y4xD79fClNlStWZAfjS1g=;
 b=XqGABSiPGGGZN4qrR0f7711WfuPiEJm7R5GiLWVJYeH/hlvJDMUKaQWVVCqBYiQsDvM1/iGx9Dxs/c4/u3F8KMZlDZcj7V4070EQ1AGE2Aebvvu8uTWupVxdagGDJBidRLOpoTmmGyE18bhduNd+BkcJHvF8tBYzPAjvD3A5ZR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10107.eurprd04.prod.outlook.com (2603:10a6:150:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:06:32 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:06:32 +0000
Message-ID: <f63a2a9b-5ef2-42d5-b423-e1924e90ad97@cherry.de>
Date: Mon, 4 Nov 2024 15:06:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] conf.py: rename :cve: role to :cve_nist:
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Stephan <jstephan@baylibre.com>
References: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
 <c329c77d-b5cc-4a28-a345-ac4261a70d3c@cherry.de>
 <D5DFJNMJZVEW.HSMGI2KFHB0O@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5DFJNMJZVEW.HSMGI2KFHB0O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10107:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b852405-c33d-4fbd-dca4-08dcfcd9e2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1RxZ0doOGlQVDR6dEg2WWVrb3NvWnFhd2IxVWhWZmduNVhzUGF1Y281WENs?=
 =?utf-8?B?TkR0c2hzUFlmb2xhZHZMTzkrUjRENW9QeG1nbHlGYTJpYncyRWlTdDNidzZw?=
 =?utf-8?B?endwRXpFMmJIUSs3UGlPazRxaW1mVjhNclRRYkI2aTFnYnF2Ym5jWWRJZ3dY?=
 =?utf-8?B?ajE1VjgyMWY4eEdyZHF0RlUwUFBvVWhwZmpxa0Nyc3BsQm9FY3J6ZFd6bE9w?=
 =?utf-8?B?UW1iV21xYVEzVHppVlN5RXdFa1VQcEFUZ0lQV0wyTnBnQ04vQXl2Tzk3RTF4?=
 =?utf-8?B?OHF1TlJ4TWEwWnlHNEcwWmN5ek9XKy8zZTFFa3VNN2docm41WEt3Qkt0YUpu?=
 =?utf-8?B?WEtMRVpreFpNU0JZdDV5RWdDYUhIdGs5enQwS0V6UERZVnRVNE9TdGxwODBa?=
 =?utf-8?B?WGFIbEVlQ3M5dmtCbWljbkpoOE5vdUZmNy9SRVdtZDkrb0c5d2dUVkhMNnRW?=
 =?utf-8?B?a0N0SHZEYzRJM09KTzE1Y0ZaK0JseERCSlI4aEIyclVCbEdPbHR5RGtEYWx5?=
 =?utf-8?B?RUFaclc4UEcvcldwNXR0NVRZRk9UUGJzQnU0WGZvdW5VcXFscVo1RUFNU0pn?=
 =?utf-8?B?dkE2Y0lZeWpTamMrT0Q0WUFLQTJpdW0yUGhSU0YwU0QvSWN2R2tIdFErRUw5?=
 =?utf-8?B?dklJUlJBeXFjRzRlZnlqYm85bjcvQ2RlVWRrdkdTaUVoT3RydjcvWVNZbHB3?=
 =?utf-8?B?czdJb2ZxTmRFa0EwUEdxZVIxdzlIMXhXeW1HamZEQlYrb1RsZ1hZZkdINTZ4?=
 =?utf-8?B?UjY0cUF1dWFHb2p6YVBpMXVpMlZyL3Y3N2puQitTTlZOWFp6cmxRSUwzMlRa?=
 =?utf-8?B?MzRncHFVa1V6WTI2ZkJJUXJOc0NWSWc4OVl0MjdjdnlIL25EUHlqbDZKUlpt?=
 =?utf-8?B?cmsrdFdnYVh0ZngvVkxVQ1NmTjByQ0NCcmdMTFBPWHliRnNpMWVVdWRJOVVZ?=
 =?utf-8?B?WktNQlcxUnY1aTNvRW5CR1EvUnZDK3MxR0JxZXIwb1cwWjZYdWl2VVNrNUFw?=
 =?utf-8?B?MEpFaFRXanpoUWRoU3M2MVk0MVp0dExvckgwRFhzZGZ0THBQZjd3WTRxK283?=
 =?utf-8?B?RVl5RzM0c3Q4M21lTDgyOHdjbEtQa3o1SXZndUZFOFJYUDBUb2ttVDFCOWhj?=
 =?utf-8?B?SW5iMnlGTS9kSFBGeDkzbENJTnY4UkovVXQrdXpsdnJrK2tmQStVYk1QaTlK?=
 =?utf-8?B?K0xSSXhWdHB4QjBNZUsyelBvNkdSa1ExTzZ3eDZzVWUyMmVQUll0L2c5bDZQ?=
 =?utf-8?B?ZWJ4SVRHSHpKb3N0U3U2cVFVUnozd2pOU0tvV2VKMUtSd2hEVFlyT2RoeC9J?=
 =?utf-8?B?bElTaE1ZUllWVjFpUEpzVG8wZFozOXc0OVhSZEM5M1ZjckFMSVo3dXA0VnZy?=
 =?utf-8?B?ZFFjak1ZOGVMUXpxMm1ESHFjaXFJUnlRanEzcWo1anVBTXVBTE02RmwzR1dK?=
 =?utf-8?B?Z2x3WHNBUzE3bExlZnlVbkJ4UXQ0VTQzK1NJcUJtWXFQY3RyN2NCQy96TmNN?=
 =?utf-8?B?WGRlaFkvWHpWYWRYZWZvTE1wTTE3THoxMlNLeFk4Z3JCNFV0aXIwSDJmSStG?=
 =?utf-8?B?M21CdkhmWFE2RERwSUwvMjhUdzBKQ01PTnNIREQ2dUt1U3B6OWFVL1c3SkRT?=
 =?utf-8?B?Mkl1ck51cm5NSUV1OTZJZUpzTTFHZHNINm5WUW5KT2xhL2xRaVhaTG1ObDRx?=
 =?utf-8?Q?/x2xinxzR4ACBswBSNHv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFpnQ1FCdWhZRHBPcXc5aGV6cVdYOFdhZjJLMXZlRHREN2pxVnNaaGxlQkVC?=
 =?utf-8?B?cUZOVVM2Wkw0V3gvaWJtVHBHRy9DSTM1cUVMU0RFUXRqUXBoa0pCa281ZXdE?=
 =?utf-8?B?bVNjWFdUeERpc1ZDaEM2Z2NVTE53VTcyaW1GaDFyUDVUZldrMXFtWEttTjlm?=
 =?utf-8?B?M0NNR1QxM3RTN21KQWdLQVZwMnBqMTJ4ZjR2SHNZZzZhajVQNGY1T1c5Z3Jk?=
 =?utf-8?B?cnZ5OE54b2RsSC9GMmR3UFRvV0d3U0Q1c2kvUmJTVm5zZ1RzWE1UR1MzeDNZ?=
 =?utf-8?B?OU5iR3pTb3hiT3RURkVORUFLOGVpcHM5ejVOL0xodDJid1lrVk8xTmlvdmFE?=
 =?utf-8?B?TTdYd1dLc1l4S1NkUTRQa0piT3F3bEtTZ0xsZkFydUpSMEYwMkdFUU9kY1pl?=
 =?utf-8?B?WGp1SjJLYWRQY1NtOU5ISlR0Y29FWjA1WlFzZG9XZWMxOVpRQzc1Y1Z0WnVj?=
 =?utf-8?B?UHYrWXNDWEpQYlB5WTFTOU9SUXh4aDJWNEVVSzVBTE9hZlpSYjNiSFVpU0pZ?=
 =?utf-8?B?NTJ3Z2NqMmVpcGEwOS9FT0RzcVlZQlhtMmJPcGxINTdxVWFmZXdDOUMyeGVl?=
 =?utf-8?B?SkM5bFR1NzhvYVF6SXVqaVV3ZlJIL1lucndyMkdLY1ZMV09rV0RXdWVOLzcv?=
 =?utf-8?B?MUU1ZnNhc3FabmZVZ3pCNWNVZm1MMGQ3YzRYeGFvZFVnWXlCdUU0Q2lpVlVD?=
 =?utf-8?B?VXhxQWZOSVBsR214M1B5L2lWMmtIL1BLTHp5b2ExOEdhRDluUDJZMGZjbXNZ?=
 =?utf-8?B?dUFKYW5ZUm8xT0M5MkpiS3FpQ3VtbGlTdkM0OVZUSW1WR0VBQ2o2RzV4bk9m?=
 =?utf-8?B?ZWNITENTWEFveFNSNW1PcXVNRk1MLzVOSTNSNTRkdUZFWjlMRzBab2ZhbUlq?=
 =?utf-8?B?YmM5K2hoSnVnNjFwM1pDZGZPb1RGMWhPdG9YQ0tWbHJJd1ROWis2enFJWG5t?=
 =?utf-8?B?QUxKK2tlWldBcUZadFd4bUsvaUNETmhlWXZ2Snp0dWw1WVEyNXJ6YjN1bW5p?=
 =?utf-8?B?b0xWbjZoOFVqcG9takl2ZnVWT25mYnlOZlQ1TEtNM0lZT29HZGpWNnozM0c5?=
 =?utf-8?B?NjIyTk9uYTBDUWJEVEZnQW9LbmlVSHhOdzhsNEg1VWZiSHlSUFVZYTMvcFNj?=
 =?utf-8?B?elVSME52V1JabXhOVW1VQnBGdFhld3o2TEZwWGh4a3RuMkpHMTJGcHB4QUNt?=
 =?utf-8?B?NXdjS3IwWnJad3V0MVBhbUZkSnJUZytWOE5rM3BNRlFZcUM4S3c3M3AxdlpR?=
 =?utf-8?B?V2lnYjRNQW9aanJScnlCUHUrZWsxQ1J6eVJtVWtWenRsOURlNTNvV2szaFd0?=
 =?utf-8?B?amNBcmZTVU5wanZEMXVqd3orSFRoUkpYODZ5NU9mUWkzY1A0YitLeG5DMjcr?=
 =?utf-8?B?VDNyMzlmay91NnJEaEtXTld6QWxBelNpS2RtTzFtbWJlQUxtSEVMZDRhVnNa?=
 =?utf-8?B?M3VCaTFkN0ZsMDNlRHBvNVljcnVPVTZEUHZBazdyWnU1MmIwTWNSd3pNbzFu?=
 =?utf-8?B?M3hDbGl6RTd1eTBJTVQvTTUzNjdqeXhROGNqYWRDLy9CTFVvRWpsZXRTcTFO?=
 =?utf-8?B?bUdsalg2QTRGeXlMcStsNGgvZ0tzZEYyUjNZTFNhWmtvYm0xVWtXTTZwWW40?=
 =?utf-8?B?ODVFblN5Wk9XWmRkYm9xakROQzcyWUVIRHUwMEtZbFhjd2FVY3FBZTlmK3hU?=
 =?utf-8?B?aWZPc1l4NkZkdDQ0YnJpK2pwY211MlZ1N05IVGlFTnZlVVlCR3N3ckZ2SWls?=
 =?utf-8?B?M1V3eTlGZ1NFK3Y2OFZBZkFlNXUzWi8yV2VEM0dDd3dUQ2dQTmUyZ3JQVEJ4?=
 =?utf-8?B?VlpuVG9LY2ttL2lUMHM1NXN0elRGNkVtMTZGb2I4Tm42NTV1cWN6OS9OY1d2?=
 =?utf-8?B?bmQwa1BRaE0ydmxjaFpRNld0MGxRbndMN3FxVnFzbldMVm84VndDMUh6ZDk3?=
 =?utf-8?B?OTF6c09SSkFmOFYza3BWSm1xRGJtM0pGWkZwbmxoOTFpM1VLUVNkUHJxdldF?=
 =?utf-8?B?b3ZwTFVRYTlWMHJqZDZqRW0xZVoxRW9IVUNSMWhvN3RmR1c2eGJsbWx3cW1x?=
 =?utf-8?B?aFNTL0k0SzhkUUJrekpoMnhJcHlnM3c0TWRvSG9Tb3VDS25mdXppZEhxTDBN?=
 =?utf-8?B?aW9TdG9ETVUvbmJUQ2tGR01mM1dMMFR3MHRwekFuenVFc0kxMEhXQjFpMjFu?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b852405-c33d-4fbd-dca4-08dcfcd9e2e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:06:32.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTxE6JGOTBqEG2H3Bf2Sis9YIllYyPPLpjDSBTpCltQ18kYis4VmPQcinQTMFPfTqvaMzQ2xlTnWB9HhptjFr/0jN97CCKBzvpjKg2CJoCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10107
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 14:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5659

Hi Antonin,

On 11/4/24 2:31 PM, Antonin Godard wrote:
> On Mon Nov 4, 2024 at 1:55 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 11/4/24 1:39 PM, Antonin Godard wrote:
>>> Newer versions of Sphinx already define a :cve: role that points to
>>> cve.org, instead of the role we defined in conf.py that points to
>>> nvd.nist.gov.
>>>
>>> Rename our role to :cve_nist: to avoid warnings (treated as errors).
>>> This is also backwards compatible, meaning we can build the doc with an
>>> older Sphinx if needed.
>>>
>>> Suggested-By: Quentin Schulz <quentin.schulz@cherry.de>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>
>> Looks good to me. I assume you didn't change those by hand, maybe add
>> the command you used to do the migration so we can figure out if
>> something's been left out inadvertently? (Would be useful if we figure
>> out in the future that this missed something so we can more easily find
>> a programmatic way of fixing the left-out instead of finding and fixing
>> them by hand?).
> 
> Hmm... I used my editor, but the equivalent one-liner is:
> 
> find . -name '*.rst' -exec sed -i 's/:cve:/:cve_nist:/g' {} \+
> 
> Which I'll add to the commit message.
> 
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> (Admittedly only reviewed the conf.py part :) ).
>>
>> For backporting, we'll likely need a new patch on the autobuilder, c.f.
>> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/docs-build-patches
>> since we want to build tags which we cannot move.
> 
> If I understand correctly, these are patches to apply to old documentation
> versions? To extend my reasoning on this, since new tags were added recently for
> old doc versions, should I update `missing_tags` and add corresponding patches
> there? I'm a bit clueless :)
> 

I haven't really checked what the ramifications are for those new tags. 
It's possible it fixes a bunch of stuff that we needed to work around. 
Maybe we don't even need that missing_tags logic anymore at all in 
set_versions.py. But that would only fix the generation of the 
releases.rst file, which is different from fixing content of old 
unmaintained releases for newer Sphinx versions, which is handled in the 
yocto-autobuilder. I think they aren't related here but haven't spent 
some time recently on that so cannot tell right now.

Cheers,
Quentin

