Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09184C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:25:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.10])
 by mx.groups.io with SMTP id smtpd.web10.18620.1736940330211553102
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 03:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aoiEH2wi;
 spf=pass (domain: cherry.de, ip: 52.101.65.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BW9W75o6SjgbeFS25NrpIRQb3eTR/2LKTdjKHlzHlGQI2ZsXfdW/bHjVwaCNxwbcGtHJFVn4OFDJABLerqD+CO6bzyavdSzKQk594UeiJu2L7UyHzAiSS01Ui7gxFmF01PiDk+SDti8vowXQZX3tbtqTpeSo+C7jC60Mkciji5SZ8UJYypPdlHQal/GqgtlatGESp7tcE/gKl38NhTeoRwFeUYp3+cv0T2uTmUd/KKod9POSucxU738vYxhlupdeJ+5cRq9qVKRXU/f2W9hCp+UOkpzoy6R+IDudblJ3SxTUo9mLfVL1n6bgXylui4ZREx0ugZ+Nrv4BftuNb5iSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDPS6pR2Qx23NwxHXhYkogoV6Y4FDVbsAThrWGfsogI=;
 b=OvKqp2T//y6KeJud8L9GGoapOW6gQv/yykCnitZ7cnPhLEOK/XE4mAadHaGmYphI8OJtk1tsj/qN9ln6QF4V/lyFWaha3Oq9crN1wNwYPuTMCPLEhNLRG0XjliM/CzasUvXuTtm4u2BDVxDcy2iDpRnVraxSagt2UCaoxb9FXbc/wEAtbuVjnvfbutgyk3XbkmNOygppXveQre4rH+xzF13159bCAh3W39TEU5jjFl8eUT936/kCeMxC0h3c16Fiv2bJet12LSBwNVyiSpmUxms1kjYjz1ojwcmFaXDDbkSjd1uLuF6aWMM0stZlEPqF7tUptbDOLM88+eUVtrGpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDPS6pR2Qx23NwxHXhYkogoV6Y4FDVbsAThrWGfsogI=;
 b=aoiEH2wixAo6MitiIfSw6QV35gojshYju2Mq2IMfvE0Io3A/+JsJcjQNYf+mWFUXuZai6McdHqEu7OihGW6OOsw0oi+rcAaazA3qPF6COU67bbghJYMrhNtyla94S0yAtcgl9raRhZJuj+T0LFmp1AFeZ4qEbHxaWjU9iEmNWS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:25:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:25:27 +0000
Message-ID: <d70991c1-ba25-4f8a-af7e-76476aa3eaf3@cherry.de>
Date: Wed, 15 Jan 2025 12:25:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 2/3] sdk-manual: extensible.rst: update devtool
 ide-sdk
To: adrian.freihofer@gmail.com
Cc: docs@lists.yoctoproject.org,
 Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
 <20250113233736.4181201-3-adrian.freihofer@siemens.com>
 <b363d565-c568-4a15-be1f-725e24f0191a@cherry.de>
 <CAB3asfiixwFwsr4Fmhct2ZsicD=6-mdDvfvz36UpJveRAo-9jw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAB3asfiixwFwsr4Fmhct2ZsicD=6-mdDvfvz36UpJveRAo-9jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:803:14::42) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cea806-a49c-413b-38e7-08dd35574fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eXROTXVMWS9pMWVDVDZFRm9IRDYweHdRZjRMdjNIN1ZGSUdJdm42TkZrVTVX?=
 =?utf-8?B?Zmh0V1dLaE50bGtVMWdTaXpxaGorNmpXdEhqbHZEaU1lMVhkQ2dYYWxhUVhS?=
 =?utf-8?B?cmVxWVNQNDB4elVzYTZnMnVsREltVWhRL0dDN0x0dnJtSkNKQXI0THp6N2pP?=
 =?utf-8?B?ZWxSa2xmemh3QUo2Z1M0USsxazhjRTY3VFIxVXQ4dEJtejE2QUt3a1JkRnFy?=
 =?utf-8?B?Sm9FQVVmbEFzWGJ5dnh2YTI0VnI1b210Q3dkR0hYa0YrU283U1pteTdYbnFV?=
 =?utf-8?B?NXFYY2hvK2hibklseW9BT2pQcTZSTEJMNmtkQ2VxUkV4aFhiZkIzYy92eGc3?=
 =?utf-8?B?OFA0Q3lnYmt3Vzk1YXJGQldpU05qeDdmb2VuUG1JVGkzOVA0QkdrZDB4WFZR?=
 =?utf-8?B?Sk9wK3dTVjR5VnhGK3JsajVwdVMvcmJ0dW4xZVBiMFdRQ1VwRFFtc2E2b1JV?=
 =?utf-8?B?RmduQmQxZXlydmNJSTVSMG5MekZpTllZTC9JNDVJL0llTWoxZVoyRlBsYmw5?=
 =?utf-8?B?T2Q0WmY5VFc3V1o4RVRlZC9zSUFKQUNuR2xJRlBJZEtQTlg0ekQ5eUtrRHRM?=
 =?utf-8?B?WU9aZnJTOFo1aFZ2YWkyNDRrV29LclVSQ3NlbXVXYkI3TjJSY3cvUVNBcVdq?=
 =?utf-8?B?Vk15Q1c5a1BJcENYdXU3Smx2aFo4NlVHUzVZVzVYdGhNNnZPUk05TTVlZkdu?=
 =?utf-8?B?QlJtaWJ3aGVtYVNVbEFtUGN1eDE4QytRS0Fmd3pvdW9MVXhwL1ljbmVZeDRC?=
 =?utf-8?B?Q1IxMEJTTmhuejFRSXJEUnE0c2lZRUpqcGgxdmFiWkxKRkVQcFYyS3pCb3kr?=
 =?utf-8?B?bjNNVkExeWYyaXN5cjczc3Z3Tmh3YnBZWUp4NTdnYkpZRlNjYnEwQ1V4U0Ns?=
 =?utf-8?B?QWZMd3VKbCtFa0l2NkpUVjhtQlhlS3NDZzVCQnRhTVZPVXJlNUNQSUhMWW1m?=
 =?utf-8?B?Qkl6RUNwR1VTR1Mrc0pSU2xXOTQxbDBzQmxMc2xSTjVCbURqelE0dG9KelhD?=
 =?utf-8?B?SFEyNnA2TTVxb09zaStTZklDZ2V6S2pSZi9MUzJrMW9RQVdqc0VhaHkvYklM?=
 =?utf-8?B?eTZEM1RXb2lJa3BhYStwNkNIYllobHlxK0JKU29NMUlkRVJhM25ueGtCQnBj?=
 =?utf-8?B?djZPUjZ6SHFURlNxVHpsZTBYWHZ3aHR0TlgyOHRGQjR3Yk9nTHk4eGE3VXox?=
 =?utf-8?B?S2prYWxCdmNTcHFlVlREVloyWlNubm5BNkY1a0IvYWdXOUZ3a2gwUThoQkZa?=
 =?utf-8?B?YmNWVWJUeE1iNis4S3NqTXAvSGtJSjRVN3ljQlRsUXFXVkJJT2Q1aXpDLy9w?=
 =?utf-8?B?M1VEMUxQUTZlYTZsa0xnQ3FlNzhneThab0VqbFRxYUpURytiVTRnOGNBWmZv?=
 =?utf-8?B?eFFmdEc0QmNRSE5lcGJQVzA3VDBGUURqZXRCYTZRa00vdndBQnRucTBhTGZ4?=
 =?utf-8?B?ckJWUUZQTG55S1UxT0JkMjVUL2xmUUNtcG1ySmpVUzJLanpUWjlzTXVaMGx0?=
 =?utf-8?B?MWEwSDdHdFhJRTRjNmFBNEdqVW5EZ2hZelRpeHRKdC8rd1NXMnl1YUkrQkgy?=
 =?utf-8?B?YTJYQTRUZXR0UXJlYmw1M0RZQmZKODJBL1FLM3puYWs0djB0bHlwenU2WnVr?=
 =?utf-8?B?Zm92VFNweHB4Y2xvWWtkcTVoRmFqT3RlMklZcVhJVEc0U1NTQVU0bTJ1L2RI?=
 =?utf-8?B?WndRMzZjWjlDOWhJYm9ma3dWb2dvMEdIakxRWE02bkM5bkE2NEpRSGNhMFNC?=
 =?utf-8?B?UjZhOU1sV25mRGVXUjBmQWRSdWc3UC9MTjhvcGdWdEc0MVE4WXhOVnFUcDZi?=
 =?utf-8?B?L3oxc3JQckFuYlRaSnhjUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUtMakVnRXVXKzcrSGJWN3NSc2FLRVFSUVRSTm03Mk5vMWdkVWFrZTlzRll2?=
 =?utf-8?B?NlFHaXlobUVSYlphczRQMHFjQ2hJSk9xazNJL1B1cGNXNFdLdTBOb2EzT0hM?=
 =?utf-8?B?OGwrcEROdFFyUFhSREdOd3k4UGkrdVZkOFRvYlNFRk0rSUFLUlVhRHVhei9t?=
 =?utf-8?B?NXErU1loelBFMXR0TklhRTBtblFBZ0xVY2MzNkRDUThPbTlLTEhzc0FLalp1?=
 =?utf-8?B?SzUyYzJtZVVURjllb0tPL3BlRkgxbk1JSW5OYkJVeHZ2NUd1eHhsVWwvUEZo?=
 =?utf-8?B?bHJBVmQycmhWVU5RbGgycDNKcDlBdHAyK1VjUDBkdG4wNFRJOHk5bk1sYmZF?=
 =?utf-8?B?TFdyZFFQUTkvcDZ2Wk9WTkIzUDhEblEyem53SWZsZWF2SFI0WlpFems5dFZT?=
 =?utf-8?B?RTNmRENYZlNWZlEyN2x0NE1iZ0VacU1KemdpQ3hZYmMwOTFnR3huZWd6empO?=
 =?utf-8?B?ZHQ4TUcxSXpOQVZiejk5LzVPVFRFV2owTTZJWTAyNTlXN0ZRZnlHWlU2UjBH?=
 =?utf-8?B?L2xFZFlxY3QrN0V3MERnY21XSXhwWWRrRVIwUDFpU1JYRG1DT2RhS3E5K2Fx?=
 =?utf-8?B?V3A1K1ZSeU1NcHZkVU1CK0E5YWhNQVZoUlJwbVRuUXpFT2h3MWxwQ3dBeE5U?=
 =?utf-8?B?Q0RhUE8zRGx1QWNBTUdzdHBncVlIdDhSZ0hJNjJLNzBySnhXRXc4VWpXS1o5?=
 =?utf-8?B?bFBSektlWVJONHVEUzhJSnpNajlDaEZLdEF1ZW9iSW1pa0NHeXVDUWRNTWxR?=
 =?utf-8?B?ZDJLVTBrUXY5OFd6WStwemdhSzRTVG5VdVUyaVpBMEpQY3NwanplTHRtcEI5?=
 =?utf-8?B?WncyRFVvR1BlZG1TNzZsQ21manhCUit1cHNBSmxZSkE1MXVpU1dLNk1zNFBF?=
 =?utf-8?B?cXV2MmMyMW9zWURWVHNBY3VKYnVZZ3hVOVRUQmlWeWdSK1p6YWZ1M2pMSktF?=
 =?utf-8?B?Q1hwTW9XWnRGSDhHd3daOFhKbXl4azNuM0oxU280eDlvd3p1ODI0WStCN0VX?=
 =?utf-8?B?bU5VUzQ1SERMYmg3ck5XejFKVTdCZTVZdzBzcFh6REZPajZEb2t5SnpRRzNY?=
 =?utf-8?B?UGJ5WWRoWWhyM2dzeUlYMXp2Wnpud0wzYVlOWkZXbVQwTGx4U0R6SWhzZFdL?=
 =?utf-8?B?b1FvL3dYSlplRlpLNTNydkFVMzIxbmgza0sveXhJUng1WTloWk9GWk1ybktu?=
 =?utf-8?B?TGwwc2FETG8zR285aldaYnA0YlFRZVhCbENWZ29OSm8vb0czcEtKTXRQeStx?=
 =?utf-8?B?Q1ptV2lGbzB3dkdMams3eWphT1U0Q3RueGRFMzYra3ZtUEZpVmIveDd5RTNO?=
 =?utf-8?B?dVRQa2VLQ3hSRDNNSlZCeS8rSmhXNzA5bHN0RFAzQlIvdGlLUlhNTC9zZXpF?=
 =?utf-8?B?NDRvT3N0NGkxeG16aDhVcHpFZmUzSHhTY2l5M0V3Y1FnNGlyL1p3dGllWG5p?=
 =?utf-8?B?SVM5cC9UZHJPZEk2QXJFZmhvZUI0SnRZZEhyMFFXYW4wcFhqYU1VNVdDVTJK?=
 =?utf-8?B?TnplSHM5ZHBkODM1V2k2TDBVTVVVUDcrd0czSWNrT1gzc3RsQzZtUnRIa2R2?=
 =?utf-8?B?N1pXNDkrYXVjMGdzQUN6TnBRY0hONlpYVkFpc01NYUdZYjRLekpWSjBPOWU1?=
 =?utf-8?B?NllmcitMOWU1bWNoa0V1SVpwNlQ1Tmo1OWFXcFJ2Y3V5Y044WDFVZ0t4QWUw?=
 =?utf-8?B?cVFuUllmcnpBbDZYblRacFRmMjlTbWVUVG1WcXd4czdQVjhUZ2dLZEEvK1hJ?=
 =?utf-8?B?OWtINUJUbE5vTnpxVCtTTjhUM2Z4d1dISXBSOHJ1THdEZGhnK2JYTHhTbkY0?=
 =?utf-8?B?eFVObzNRM0tsaXRCY0xuOW9NeDFaL2EzV2x2NUdHTzZXMEwvMkRnMWZaOVlC?=
 =?utf-8?B?Z0p4VTZKZW50RWFmclRuMFRzM1g3UnBCVzhhV0tmeVlLNDQ5Z1BxNFByck5G?=
 =?utf-8?B?ZUQ0TUpiQmg5MkMzZTdCS0gzMnlWa09xNjZlbnFpS2FhMlpjUllKdFFFRWVH?=
 =?utf-8?B?b2gzdEFzcUVXWnFMMkIvZk1TMk4rTEl5NTZ0alFtZS9XMDU5ZUlLZ3ZHd1V4?=
 =?utf-8?B?ZSt6aXpsVks3dlBPQTdneW1BcmN0bzVjL0IvZlBwWi9ndXdXZWlmY0dGa2hB?=
 =?utf-8?B?UTcwcVlCdTlUV0dtKzVsN0JHSTBHTHZ0dm9wdGJaMHZDQWFzN3pJOVBZUFBQ?=
 =?utf-8?Q?Mk0soTYwxsmCIGP6MiEqmlw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cea806-a49c-413b-38e7-08dd35574fc9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:25:27.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9kzMILIM8O3cYRTS1uljeLaW4NIOZeUuMRx9+NCwiQECZ9CWx4YNSrfDF9m2nSVUOaCHdZBC45tCIiHXTwsyz9/kSoPiBXi8K1DTmq1Eok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 11:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6114

Hi Adrian,

On 1/14/25 7:21 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Hi Quentin
> 
> Am Di., 14. Jan. 2025 um 11:10 Uhr schrieb Quentin Schulz <
> quentin.schulz@cherry.de>:
> 
>> Hi Adrian, Antonin,
>>
>> On 1/14/25 12:31 AM, Adrian Freihofer via lists.yoctoproject.org wrote:
>>> From: Adrian Freihofer <adrian.freihofer@gmail.com>
>>>
>>> Replace
>>>     devtool ide-sdk --debug-build-config
>>> by
>>>     devtool modify --debug-build
>>>
>>> This change was introduced with commit
>>>
>> https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb
>>>
>>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>>> ---
>>>    documentation/sdk-manual/extensible.rst | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/documentation/sdk-manual/extensible.rst
>> b/documentation/sdk-manual/extensible.rst
>>> index 9a50d7fc54c..3733997fac4 100644
>>> --- a/documentation/sdk-manual/extensible.rst
>>> +++ b/documentation/sdk-manual/extensible.rst
>>> @@ -669,7 +669,8 @@ The extensible SDK supports two different
>> development modes.
>>>          IMAGE_INSTALL:append = " my-recipe"
>>>
>>>       Assuming the BitBake environment is set up correctly and a
>> workspace has
>>> -   been created for the recipe using ``devtool modify my-recipe``, the
>>> +   been created for the recipe using ``devtool modify my-recipe`` or
>> probably
>>> +   even better by using ``devtool modify my-recipe --debug-build``, the
>>>       following command can create the SDK and the configuration for
>> VSCode in
>>>       the recipe workspace::
>>>
>>> @@ -786,8 +787,8 @@ The extensible SDK supports two different
>> development modes.
>>>       .. code-block:: sh
>>>
>>>          # Create the SDK
>>> -      devtool modify cmake-example
>>> -      devtool ide-sdk cmake-example core-image-minimal -c
>> --debug-build-config --ide=none
>>> +      devtool modify cmake-example --debug-build
>>> +      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
>>>
>>
>> Considering the commit log that introduced this change, I wonder if we
>> should mention this in the known issues of older releases, though I
>> guess the whole example simply doesn't work?
> 
> Well, all examples have always worked. There is only one detail that did
> not work
> When devtool ide-sdk was called with the --debug-build option, a build
> configuration
> for the IDE should be generated that compiles with e.g. -Og instead of -O2.
>  From the
> user's point of view, debugging did work, but with still optimized code. So
> there is
> definitely a better user experience now than before. But it has always
> worked
> reasonably well.
> The VSCode bitbake plugin called devtool ide-sdk without --debug-build,
> which was also
> not ideal and has now also been improved. However, this also means that the
> broken
> function was not available for UI users with older releases.
> 

Ok, thanks for the explanation.

>>
>> Also, we should probably highlight this change in the migration manual
>> somehow?
>>
> Assuming that the feature has not been used that much so far, I would

Well, I don't think we have telemetry in there so who knows if it isn't 
already widely used :)

> announce it as a
> new feature of devtool modify and mention that the same but buggy feature
> has been
> removed from devtool ide-sdk. I can send something like this going to the
> devtool section:
> 
>     -  Replace the anyway broken ``--debug-build-config`` option from
>        ``devtool ide-sdk`` by a new ``--debug-build`` option of
>        ``devtool modify``. The new workflow is now::
> 
>           devtool modify my-recipe --debug-build
>           devtool ide-sdk my-recipe my-image
> 

I would put this into the migration manual for the upcoming release 
which explains that it changed. The issue is not documenting the change 
in the documentation part itself, that doesn't matter much, but rather 
that something is required on the user side to debug builds.

Considering that devtool ide-sdk will fail if --debug-build-config is 
passed, I guess it's not THAT big of a deal because it'll prompt users 
to check for a solution, but highlighting it in the migration manual 
could help a few users avoid having to look for the new way to do it (or 
debug their setup/ask for help on the ML).

Cheers,
Quentin

