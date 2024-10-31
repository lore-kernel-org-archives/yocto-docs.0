Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60453E6896F
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 10:13:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web10.9200.1730369629742789151
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 03:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BfTAfCc0;
 spf=pass (domain: cherry.de, ip: 40.107.104.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF7PGq+ftMExBOebSRVfhQ/b4DKQdifK8cBL9mrGJ8zK+TkxZ1m3DC/tUe9bICqK7r1Fqi45+jvVoqDbBoWAkVL19R/LWNSjqSK2EYqLGMDvw9700uoIK+FZ/mF0ge6nU+1conGZRuZ2HukxrvD48buGSspRqQufAM9qud6zFE1T5k17SYo1WHhFmBrNSx5v2MQYQvX2R2rtJmgP+jUNUeb/WxeKkEPvhHSKw022E7KF2tF3dA8f8ccealcRuPN9iiE4eLGcJzUcpiE7669HMui/n6ZetGn61saHqrZhAWdQ5egKk4Wtr4eB+JzL4HwMlySC4teY2KyHatPC9Mf4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcXUe/PyRHHuvJM8QXPk9Vtuf5d+b8Whx4tQIpS0IhA=;
 b=TdB1pzr3X5YwkZ3UNi2xhYI36vfxvUYu1Th3vpD1QwfHCAhVjepMNbqeeuw8tjl0BW+c4BzaUZ7gwdXF5KXQcc0MlnwcKpx3A9N6WFiU5rgikZbENiGcgD3+tqH6k9obobFKNI9nzeWsR7XpeUt1+w6yNNUxTLnGL6XqzG7No+k8/ABDBSS0Hf2F0kbRL73s13yCvDYPzAmkaLY6DUBTeYOuP1sH4VXlJDz8IbL4LRWsiiXSYLSU1Yb2tK/alfamOrlnggvEvqQmQLkJcNxpzk3+WcFXSd9bPnxJomx1fHQnm532nW5rivu/odfjK0k85EXTayemWum0OP5DLbsfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcXUe/PyRHHuvJM8QXPk9Vtuf5d+b8Whx4tQIpS0IhA=;
 b=BfTAfCc0fK2ECJvdZi0Q3JTONki0d71AM1NSufH+oEtDxHwAsgi8AYItI/n8k0eYPangAcWZvvBC/w0N1GZ+8P+SdDvzv+5WctKH8Jv8pJJbXLWtxvqAMRmlHK4CAm6ou3JDfC6dj8D7uvJfs7iUA1eLau6nA89eXPEU84ccxf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10437.eurprd04.prod.outlook.com (2603:10a6:800:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 10:13:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 10:13:42 +0000
Message-ID: <59a684e6-a77a-4084-9f9f-0cad7f6fccee@cherry.de>
Date: Thu, 31 Oct 2024 11:13:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] dev-manual: document how to provide confs from
 layer.conf
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
 <20241030-layer-confs-v1-2-0f7dcf460e27@bootlin.com>
 <4fa6fe53-13a1-41e3-9604-ffb9698b78ca@cherry.de>
 <D597PUBREPC3.3UL7RTF5HBN0X@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D597PUBREPC3.3UL7RTF5HBN0X@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10437:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f258ff-31c4-433b-d9d3-08dcf994b2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2tuUEpBeFFKd3NubCs5V2thNUdlUlBJRkRuZ3JjVHg5YXhtaVBMMmVkQzJ6?=
 =?utf-8?B?ZGxhUHVFNSs4eTI2MFB0blJjTHlXNXQwK0NvUWFidHRjdWkrNkVBOTQrYnBu?=
 =?utf-8?B?dUY0NFFsazcwbDQzQTcyeDBNVzRwN21seVhyVUdReUJtcnFBWjdZK0ZIc3lJ?=
 =?utf-8?B?S3p2aXpkNEhBeW9EMlJLM1YwK1o3N0VMN1MxVDZqVlNpUHhaeXNDZHlNV2ow?=
 =?utf-8?B?YjhuVElqeks1MDdZUUYwNkhQVnJMV2JpVTAwbFB6YVNpeStESXpyU2VZZVQr?=
 =?utf-8?B?YU1INGtFSlZLOW5WS2E3RGJFRUVDSFhSSUw5ZUZTSUQzRzc0ZE5uSFFMenhj?=
 =?utf-8?B?TGNWUDlVbzVkQnFqN293NSsvTy9tcXMxQk5OVGhGcTFYRjMrbDBsM2plRVhL?=
 =?utf-8?B?RzZEOTE2TVNMemo0dkt0SDlzUnhtcFVxdUwwQ1ZleEk0V1ptQU9FaExJQmwx?=
 =?utf-8?B?aTQyS0FuY0hKMExseDQrWkJPSXJVNElDZmdVSjZEU3FzVkJGMHVaU1RLUjZt?=
 =?utf-8?B?NGYwcXZTYXQyZXU2MDYxanhHZ3ZDS0oxN0NrTzlwSFhGemtWbU5ray85TmEz?=
 =?utf-8?B?ZnM3WUc4eE1qZVFxN0FHMlp3Nm1reldXUjZYZ1plcUNXR0hCNmhLYnhGVVRL?=
 =?utf-8?B?RHNYRTQ5dCs1M3VKUWJIUElSQmFIN1pjQkJuOWxmVFh6WmFEZDJxVXpyTlRr?=
 =?utf-8?B?V29WVlFYMlk1MXI0dyt0YzUrTk9GbjZ0ZzFFWU0vd2tTWjdONmozUlZPKzMr?=
 =?utf-8?B?V3hUSXZEanpuZmo4K3ZxaXZlYWxUZjJzWHJIM3Y3dzlSTGpwb3Myek5rMGxh?=
 =?utf-8?B?YksrZXI5cVdRbFF4aE9Qc1ljWHVJVXRFL09xYTg2OVFKNVdIMDArS3NOV0wz?=
 =?utf-8?B?cW1zWVhVTHBsKzBxeFNBWWYwbWpWTFZicE1mSGNrd1BwUXN0Unp6N3EwcXRx?=
 =?utf-8?B?NktOQk9KZTdNd1VJYWlUNVRZdjdORDVYZk5DYWRWVUp2MWFvSnhGRWRmVHBU?=
 =?utf-8?B?eU9DZ2dreUtibEQ5QUMxMFZxMklCM3ZSYWVidnB4NjlsZ2ljRFBvMHBQVW8y?=
 =?utf-8?B?N09JSTlxNUQ3MHAvUkNmKzRuV0o3WkJORkpOQndXOEV0WTNJNVZBYmQrWDh3?=
 =?utf-8?B?ZmJWbnpOVjg3UE1KNG4rMGpKanFOTjBKQmNDcXo3YmZWYmdKOHRqMDBJc056?=
 =?utf-8?B?YlBVNkYyMWJuWDcxRVRvUVBSY24wSHhwUWM1R09kc2hTRVVUaGZTYzgxdFpO?=
 =?utf-8?B?S0NUclhnQlZnSVlzR3lVUG9XMXBqKzVwSGpRRVcyTmJkQnNDU2czZXBRQVpJ?=
 =?utf-8?B?SFhDL3Zqa2pRQUdMaEd3RkdaNUpyRk81NnVxKzNuK3ZMVExkT2Y1KzZXZmt6?=
 =?utf-8?B?cDRWVEpyaXZiVmE0VUNWMUtpeXFxZW5sVGtkeitOMXJKaUFNU0FYNGo1VHRV?=
 =?utf-8?B?REtJeWN1endpSEdnQk9JNWVnU3hnZ05QL3p6VnhHZ0NTVWM0emVEeXlXYmlO?=
 =?utf-8?B?UVBBSDNlMnZlWnBtT1dPeXZIQmR2YWhlZ25STnoxdW1LUjZLaDFsWTV4SHBL?=
 =?utf-8?B?bXZtN3NDMXBEQ2ZjVXJyZFk1SytNZDNDR2c5MWRvd1BmY2Y2QTRHeldreU9M?=
 =?utf-8?B?VXJSVTBCZ3pWb3B6Z3RYQnJnRExGSTFFMStDRlFLOGUySXVIbjk1d0NCbE9V?=
 =?utf-8?Q?J/fuTHo79kczCcDNzH6Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDBwRkpGNUJYZEt0SXRoYW5BdkdDSHJoV29NUTFYaG9ZVFc4NHFBMXBlQ3BY?=
 =?utf-8?B?RWkrbEcrUkd0VFlvaWZBcXgrcEd0ODNZN0YzRGY1bENISkF5N3lkVE5yM2Ir?=
 =?utf-8?B?djNDVUJ5YkpEWGdPUldQdUk2WFBQS1JEYWlZYWY5MDBQbTA4M3NURTYvSmRE?=
 =?utf-8?B?UDdNdG9acGxZMm9YbytteDBYeTJKN21HNk81SkhoK1ZGL1BqSHRZb08vWGN1?=
 =?utf-8?B?T0REY0pDNnRsbFA5Y3Ivcnc3WHNKYVNxVENSUW9ReksxZEdJeS9KVFlkYkVS?=
 =?utf-8?B?dU5QNm43Nk1DRmpyUTRJd3JNSWtLRElYU1BFajVORjg0YWlSMXhTZXJDVzNx?=
 =?utf-8?B?OG8wckdoZmNRdEJJZDhuVzZqYTBremJkZmF0Zy9NTVgrcERwZU1JSHFIK0xV?=
 =?utf-8?B?T3JoMDBkb0pBKzBlT1RGVHJKSFFxdHZ5bVJ3emxUa2FhY2VEejBuRmFhYS9h?=
 =?utf-8?B?OWdBS21qRCtNcUxFZHZFY01GK1J4cVVPYWNNR2FjTS9RWGtTL0hTT1d6K3pm?=
 =?utf-8?B?TFMxNkZnbHVwQldhSkwyc1g1Q1E3My9ZL2dIMVNLMHhRa1hYeDBjUWlwejBt?=
 =?utf-8?B?bm1KZzc3cUYvS0VDU2x4UGJEbEJvVWJSVXJMSmk4SGJlZktnWk95QkxqaW9N?=
 =?utf-8?B?NW5naHpaMWgwQ0EzR1JNMVVUdzZGTUFYcGZjWGJFZUtIN1NORlRDUmllajc5?=
 =?utf-8?B?Uy9oOTRLTldUU2x5bjFrai9kMVI1VVJVWHhqLy9NN2JUMDhnZzdjVkRScG1P?=
 =?utf-8?B?OTM2M3RYL1RDdWtueGZ2VXJDQkVNSmQ3NG4xam1CQ1NsUitWU3BKc1J4Tldr?=
 =?utf-8?B?aVVhOVpWcTE3aVl1Z3g0MVB5ZHlhRDB1OUdyT3lRMFVYNGk2K01GWHl2Z1R6?=
 =?utf-8?B?ZzhOTFJ4bm0ydE00bFM3VTJ6ZVgvM2NVemVSWkI5dktXck5vZ3kyeHhmNXlo?=
 =?utf-8?B?Vnl3cnhWZzR0OERGY0h0ZnEvbHNEYjdJMnVIY2VQc0Nib3NSZzNOQmNIb09N?=
 =?utf-8?B?TFUvY0pKSzFtdlc3UkVrcldpdUs3cHNZVEdlMkpzUGtBZW9YNEZWaTh5TVBX?=
 =?utf-8?B?TjNGcFdnS1orRi9qdExCQWxNUXZqNVRGRGlGMzYrSkJtTHkwRnFIRjhXWDg3?=
 =?utf-8?B?OXlnakpjVDhORzQvOE9ZVmVrQ2djTzJkWEJrcXRwYlNkNFdIdFVELysrWXFk?=
 =?utf-8?B?TGRXMGVVNnVqVVYraitqZ1FRQ01KVGthS0lXcUlEdEp5SzUrWVB0YlVKQm9D?=
 =?utf-8?B?RHYxeUQrdi9vb3BBNnoxKzU2QUZlS0luUjVSeHNaYWs4bkljb2N1UXpOcm1T?=
 =?utf-8?B?aEdIYkQ0RGxRQjg4cUdaa2hzdDZhaGtzbEhuVzk4MmFkT2ZWNG5mUzhxcGhS?=
 =?utf-8?B?ajFkWnFHWWxjRFk1T1JzYjFETWNRcno2anB0bVVLbzNTQWdFZU9IU2FVVk9y?=
 =?utf-8?B?Und3T2pRL3pNWGg5eDl4azBUU1R6RHJ0aExxS09iUmZZUFB0dFA4bmd1ZlZT?=
 =?utf-8?B?NERVS3Zhd1RVR1BoNzJpelV2M0Z2WnlteFpkN3IrNnBZbEV2MjRBcXJFajdK?=
 =?utf-8?B?VURDNldyNUtsVlZYbFZ3dlFLR3Uzdi9TRm1EMys0Ly8zMjFuWDg5UFhqOS9Y?=
 =?utf-8?B?R0trdWpDUTVjNHFUMVA2cTBTdXNNUmpMV2tPcDVqbms5dWN2NFNwdFIvb2t3?=
 =?utf-8?B?U2VQWXhMVjBpVU9pUTZnS1krREtGb0JPTk04TU0rcU11elc4d2E0QWhEZ3Iy?=
 =?utf-8?B?eDUrSFFJUW5rMjRWeVhtdmZOK0hIdVhHMWxobmFsNGk0VitCS2ZKWDFCZDdq?=
 =?utf-8?B?NXNLbWozaXZNanpFYnRJeUZLMGxSQUFsQ1dOSUtQeTk1bmVKY3gwczA2dlV0?=
 =?utf-8?B?OUxaK2FNaDREaXp6Q0ZmVExjcXF2ZVhCMHY2cUx0Y210cktuYytsTmJ6NlNN?=
 =?utf-8?B?SWpYeUYyOC9xTFVoR0ZKZVpoWmlXbWJGUkhHeGlVQ3VwV1pITXFpeVZSSFJJ?=
 =?utf-8?B?c1hkRjBwNFBMckgvcHU5c20wcGNWbG5EeTJsVnNaWTlscEpmVjUxSjl5Qytw?=
 =?utf-8?B?bU9wMzJlVXE1UWtDd0JzQ2s2Y3VPZkNwSmtrVGJudzlaZ01xcHdEd05ORWkz?=
 =?utf-8?B?eWpIUk1rKytpZDQ0ZVpkUVlEeG5hV2FDdzY3elpMQ05MbWd6UUJBNWlhSXZW?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f258ff-31c4-433b-d9d3-08dcf994b2ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 10:13:42.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnsRCRIzucaSyDS/FIifa+uXW5mdhBBftJ6uVh/s01Erj6/eNZ4UJbxSe3QNuAC5wVt8N2zMuu4zgTf0zrC+s8VbvcB3P3J1L35VP2kxH2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10437
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 10:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5627

Hi Antonin,

On 10/30/24 3:32 PM, Antonin Godard wrote:
[...]
>>> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER` for the
>>> +``linux-custom`` recipe::
>>> +
>>> +  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
>>> +
>>> +This can be defined in the ``layer.conf`` file. If your layer has a higher
>>> +:term:`BBFILE_PRIORITY` value, it will take precedence over previous definitions
>>> +of the same ``PREFERRED_PROVIDER_virtual/kernel`` assignments.
>>> +
>>
>> I seem to recall this is the perfect example of what we do NOT want in a
>> layer.conf though (might be bad recollection though :) ). I actually do
>> not even know what'd be a valid reason to have variables directly
>> defined in layer.conf (I see you're providing an example in the next
>> section, but do we really need this section to provide an example of
>> something the user shouldn't be doing?).
>>
>> I would add a very big note/warning at the end of this section saying
>> that this is almost always wrong as it is mostly expected that adding a
>> layer should only minimally change the build output. And that for this
>> very example, it should be in a machine or distro configuration file
>> instead.
> 
> You're right, it's not a good practice. Initially, I wanted to document only the
> conditional case below, but it felt strange introducing it without a note on the
> role of layers.conf & setting things from there. What about the following
> changes instead:
> 
> * Remove the first section that shows how to set configurations unconditionally.
> * Instead, introduce the next section by saying something like "Since it's not
>    good practice to unconditionally set global configurations from the layer.conf
>    file, we can use the following technique...".
> * Simply rename the section "Providing Global-level Configurations With Your
>    Layer" instead of "Conditionally Provide Global-level Configurations With Your
>    Layer". This way we only show the "good" way to make changes from layer.conf.
> 

Not sure to understand if we would have one or two sections there.

I think it's a good idea to mention what the user shouldn't do and why. 
Starting the section with something like "please do not use any of the 
examples in this section as they are bad practice. The reasons will be 
explained at the end of the section. We still add this section as it's a 
more accessible introduction to the mechanism that will be used in the 
good practice explained in the next section."

>> I am not sure that BBFILE_PRIORITY is applicable for this as what
>> matters is the parsing order of all layer.conf files from entries in
>> BBLAYERS. I believe it's just parsed in the order it appears in
>> BBLAYERS? Last one has priority (because we use = and not ?=). If that
>> is actually working, we should then expand
>> https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILE_PRIORITY
>> as well because it clearly only defines priority for recipes.
> 
> My bad you're right, it's only the order in BBLAYERS that matters, I'll remove
> this sentence.
> 

Not necessarily! It's a good thing to mention as people may wonder why 
it works on one build machine and not another, and people then figure 
out that they including the layers in a different order.

>>> +Conditionally Provide Global-level Configurations With Your Layer
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +In some cases, your layer may provide global configurations only if some
>>> +features it provides are enabled. Since the ``layer.conf`` file is parsed at an
>>> +earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
>>> +:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf``, and
>>> +declaring conditional assignments based on these variables is not possible. The
>>> +following technique shows a way to leverage this limitation by using the
>>> +:term:`USER_CLASSES` variable and a conditional ``include`` command.
>>> +
>>> +In the following steps, let's assume our layer is named ``meta-mylayer`` and
>>> +that this layer defines a custom :ref:`distro feature <ref-features-distro>`
>>> +named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` variable
>>> +for the kernel only if our feature ``mylayer-kernel`` is part of the
>>> +:term:`DISTRO_FEATURES`:
>>> +
>>> +#. Create an include file in the directory
>>> +   ``meta-mylayer/conf/distro/include/``, for example a file named
>>> +   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
>>> +   ``linux-custom``::
>>> +
>>> +     PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
>>
>> Random thought but maybe we should have align this with three
>> whitespaces starting from the first character in the list. Here it is
>> only one and difficult to notice at first sight. Actually, it's two
>> whitespaces, I think that proves my point :D
> 
> Yes, it should be 3 actually, missed that!
> 

I think what makes it difficult to read is that the last line before the 
codeblock is starting with two tick quotes. Let's see if three 
whitespaces help, but in any case being consistent would be a good 
thing. And it seems we aren't completely consistent, c.f.
$ mysql -u root -p
$ cd /var/www/toaster/poky/
$ source oe-init-build-env
/etc/apache2/conf-available/toaster.conf
/etc/httpd/conf.d/toaster.conf
/etc/apache2/conf.d/toaster.conf
Alias /static /var/www/toaster/static_files
...
in documentation/toaster-manual/setup-and-use.rst

[...]
>>> +
>>> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
>>> +   the :term:`USER_CLASSES` variable::
>>> +
>>> +     USER_CLASSES:append = " meta-mylayer-cfg"
>>> +
>>> +   This will add the class ``meta-mylayer-cfg`` to the list of classes to
>>> +   globally inherit. Since the ``include`` command is conditional in
>>> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
>>> +   effect until the feature ``mylayer-kernel`` is enabled through
>>> +   :term:`DISTRO_FEATURES`.
>>> +
>>> +This technique can also be used for :ref:`Machine features
>>> +<ref-features-machine>` by following the same steps, the only difference being
>>> +to place the include file in ``meta-mylayer/conf/machine/include/`` instead.
>>> +
>>
>> I don't think the path needs to be specific?
> 
> Not really, but I'd rather advise here to place it in a conventionally used
> directories (since we generally use this directory for machine include files)
> rather than giving a random example. What do you think?
> 

I would remove the mention to "the only difference being to place the 
include in <> instead" and instead add the following:

Though not mandatory, it is recommended to put include files for 
DISTRO_FEATURES in your layer's conf/distro/include and the ones for 
MACHINE_FEATURES in your layer's conf/machine/include.

Which provides the necessary information I believe? "You can do whatever 
you want, but it's best practice to do <that>".

Cheers,
Quentin

