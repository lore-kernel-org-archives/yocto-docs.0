Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D62C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:21:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55120.1786458099780352109
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 07:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=J5jLQU6J;
 spf=pass (domain: cherry.de, ip: 52.101.70.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfUVEFr26N58a9pKiGbe7SjYBuOgP8aApf8DaZR5lsbTlMcCfkb151qVAA2pGr+VwQazravhux52n8rRZ43h3ZTzXBP9DHkiKkSnfW4GOI8nOcdiKOwCODQx4JoHMGaJ/+0SlWCYKHdLrWLNk4S/0EqvUkYpzAnooKDcH+MH1NhdYZuSrxPk7EoinV3db7fr7rqEyRG0C1kas74jgnvrWifJ1orzhWR6loXaD0JnaBcuBRoVn37UrRMtp021yHw1rrilcE4rTbeAfWLrp14OlVg4FIm+bUXFKsd8q7WWMfm0R6PB7mlAh4ADSgL3dL5L9AUbrUh50dj4X475PhSFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWdlh6EUqnc85NfuBFvEgDXr0EOtP6PeNy/eAAUCQ4A=;
 b=L0HH/F4qJqDlpEogUiGn08ksePvOE++l2lJjv34s+RyNaxqc/eKmlXS1Sqz7eEFXK0hQb7ry5mKPTir5IWRyqWF5gGkNhCJQ8mSqb4xOHvvOoLkHyeIIUmcbdtKaUbwly2PTe8Q/Wv6mzd9dqg6uJyOhn+z0Njv0xAP/NFBg6txuJYl/Zjy9ANAMZpCM6bsbO6cjyMpD2tB8WiavdRyvzkjZ7MQlyXQueqBUF3F59NAUA1+FLFtJQNZpRwyevFDfL+q1Ahd2rDuasmCJQS/V6PyEJjBxcF7Zake7QjJh+Kmjq6rwt5MksToWnV7kphgmor6U98rcHWOGZXEyuMNCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWdlh6EUqnc85NfuBFvEgDXr0EOtP6PeNy/eAAUCQ4A=;
 b=J5jLQU6J1bpLgWk4BYm5DH18WZMYLmSQ7CAj3z2qPIHSp+uH2UHv3x6LfQs2OAloOTZXYr2f4AB7Tprae9nWvHAPHhosmbuzfkclSKIIH/Pty/0kdWmtEpEjlO/rXn9Qre85oEzCx74pXiq0MQlKMY5vMBMTqqqHkGSNgDKj1aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PAXPR04MB8271.eurprd04.prod.outlook.com (2603:10a6:102:1ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 14:21:33 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:21:33 +0000
Message-ID: <362ab1f3-f0f6-4dcc-a574-82eaa4debed5@cherry.de>
Date: Tue, 11 Aug 2026 16:21:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 QB_DEFAULT_BIOS variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com>
 <dcab219f-68a4-4323-8876-f27b1ca7c3ca@cherry.de>
 <DKM6FRDAN66C.2R7XLGJ615WDL@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKM6FRDAN66C.2R7XLGJ615WDL@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIVP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::10) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PAXPR04MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 21be7f00-708b-468b-c739-08def7b3d888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info: 
	JN1qZ1vr6Zmd7L0fq33BhSmOKvqbxjVImB59D6dWX6rMsbi6580qmUwnydqhFDTz/rt5pDVeid1afLZZwOvzD+kqrAXWZ0njZBmwmxfwQzwy87mRnY9sZdsDzZeea5+zTETa7zT64y9eciveEcnPRgapuTBGpLMsb9mXyanCU2roMAuyUYSayChC+MsTQ8Tp2o3N2iaL86khPYQwAlA4fiCPqWf/UsKkiBp6XxdAy66VstsYwr1Gc6BeiSBjebelqu2f9A2qRL1F+dQqTUIIs3AJv35UERjHtrGF0v+kOSo1CvYQzFSDBwhtHzW6maRFG4XKFw41d47FvVdK9aQvPKQjkHlH1nhQStRMGPza2zPlODi8ruhaY4RUlOSdR0B8+l8k33QjoaX+HkJ0bMmJwvb78WX/Ql6/nx8f5Sx/b0jVL9QtH+Om29Id1mXPeI5BGtMZ4VzDrTjrJsViLGkdP5V9HNB1PcfyvXjOBLKHH8AG9hrEdm96iPfJk3fC34iH2H7aNDBqflRXGVOxuW96F2S8ebaKA85ry0hGKG88Ra3D+6yws7bP7rvadBUrJNnzyuNOSo5Iwuh2bzGuvpka+1Qp8v4y/iSwy55veKu1naI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEd4enNFeUtRQzRuYnJJV200dzV0RWluWjVneEN6QlZyN29VZHJHN0RHc2Z1?=
 =?utf-8?B?MlJ4N1B2ZGlwZjROaVlnL0tRYWFsY2ZoL1RQODJSSGFSdFk3aTNyS3MwZWxN?=
 =?utf-8?B?ZTF6bExCSkhpcTFxUlR3R1ZHa1EvMW1keWxlRVM1N29QSW1qcGY5N09qOFNV?=
 =?utf-8?B?ZzJ4Z05rUXF1SFZXVlNNcWJWek03WTdDNmxXY1pzUk9penB6SHU0a2FWdWJp?=
 =?utf-8?B?czY2Rm5OT3h5WkpvVXBXOExKbnBPV0lZYiszcmdneWhOVkZqWStzeXpHc3I0?=
 =?utf-8?B?d09NRUEwc1ZPZE9BTVRMclRjV1hSR1Y2aXFMMGdMWU9XbUVvVTM3TG82NHBM?=
 =?utf-8?B?TjNxTHhvRUo3TENVbFJjRXprdW1JWlB0YnNCSzYzQUtSMzBtZEVreXJhQm5C?=
 =?utf-8?B?bVFDS05DMmtVdjEzU0d5c1h4TDRGQjFOZFV6VVdsNUFmN2hWQUFDQThBbWtF?=
 =?utf-8?B?VTM5SzJzSDROeDR2czlsNGtobjhURnRQM2Q2L3pFZDJZQ25jZERKZmcyTEN5?=
 =?utf-8?B?OUsxWnZnR1lScnFqajJ6NHY5Q1p3QWZVMURBaXBkZ0Q5d0gxMGZ0OWo2MFZW?=
 =?utf-8?B?RnRqcFJwWXpnOENabW1oL2hhbEsxaHYxQW1ZT3M3Zm5tZ3RFbGxiekJxcExl?=
 =?utf-8?B?dlpHdWI5Ujk3STA5YUxmc1FyK1BwVExoQWxvOFB1VCt3dlM1U3lFN0xWblc5?=
 =?utf-8?B?VDloanhkUXhZUWhLUXV6UGdXOVdNY1Z0d2xEalNRU05EV1Rrem5TVTliTkVS?=
 =?utf-8?B?ZWVtdC9rS2tSOWpJUjMzUkMzRzF1K01kWnFwVjRjVzdETFBvdWt4OVBGRHdi?=
 =?utf-8?B?QXlHUklXVUErd0FtdU10RWNOSllUYkoydnpyVkludFBEUjRnZ2ZUVy9sd2Zj?=
 =?utf-8?B?cm5Tb1MrOUtscUxEdXh3ZERKSW5yRXIzdnJtVzhkVFM1RTM1NTMwMHo3ZXFF?=
 =?utf-8?B?YTZxS1NETzFZSDhnSVYyWGZNRUE2YjNBRm5POS8xb2Mva1d0cnM2ZVE4a2Jy?=
 =?utf-8?B?blNBOFFSeDVXcmVKYzRLb0ZVeDJ3c2ptLzA5MHoxdFl5b3hpL2dTdXBSK3pq?=
 =?utf-8?B?N2hta0hubU5JbEg3ZFdUNU1GdjhCa3FvN3MwaVhwTWNzYXEreFRhb0FNSnRx?=
 =?utf-8?B?MVZLR1pmclh3aXRuZGpVWmYyaXB4aWpFejFhcTBRMGVQZ213Y09VWDVaMHpG?=
 =?utf-8?B?eVVIdWtxaXprcXArM0VSM1dXUzlTM01UOHpTNjdWQWl3VzN3KzlpQ1FPRU9U?=
 =?utf-8?B?OFdlZHNiQkJWTFBKU1VGRkYzTmoybER2UFBaWUlrUmdtWnBNTXV1M2hubktS?=
 =?utf-8?B?Z1NHaUJzblQzd1RVaXZ5VUFOcnhVanI4U2R1c2x1YUhVcjBhQ1ZDVXZNaUVr?=
 =?utf-8?B?cHgyL0llT3dKQTRnazhEMCtlMXF3MTZLQlNkSFJyek5aYTNYUytHL0x3V0Nr?=
 =?utf-8?B?UzNOTXJpNTZUYm1leTZSZGhkQkN6czlTVUIwVjlmSE9NbGR0QWNPZm1GcHZH?=
 =?utf-8?B?Qlc3aGErdmxVeDE0WkhCZzdmSXBXd1hEYWpva1BSOWlxNXVXNVZLTUNZdzBK?=
 =?utf-8?B?Y1oxblIzdk4vbGJPZS9uRUY1U1ZVLzVxYkFuU0lSTlJ3K2poMGo1RUhJUHFQ?=
 =?utf-8?B?TE92L0U2QnUzTHFNY2RnKy9aMmJWU1hFbUNJeDY2eWlJV09kdmtaMDM4VWdu?=
 =?utf-8?B?bjUyMCtmMlM0R0thZEJWM2p0ZmV1aUxWTEgxNzN0cnhEeWkvUjJZUlhPNzNW?=
 =?utf-8?B?MjNVMDMrU3IxTHBxNkJmSkxXN0ZpYmgweFpEQmI0RmtJeTY2aGJxYkRBVXBr?=
 =?utf-8?B?ejFwazdTN0pOYlFEMnkxUUhxNDVNSDZ2akh4bTFLOHJoQWx6WnpwbW1wZXNu?=
 =?utf-8?B?UmVYN3ptOVR0OUR0RjFWekE4aFFRbEVDMEVYS3IwVXFraUdhMk1Zek12OHRW?=
 =?utf-8?B?YkNnY1dBTmRMMmYxOFhobTk5bEpRNlhoVEJLdE0rWjFmU3IwKzRMTVRzcWM2?=
 =?utf-8?B?SWJ2NkdITS9FRkh0cmFKNlZRc01oNkZtZmYzY0g0a0dJLzhJLzVaWG9SVmNt?=
 =?utf-8?B?NFRPaWxwbWVCMTg5U3N3MEt2MU5BYmJpMnZUMEFZVVZ1SWVXR0FTSWRpY2xa?=
 =?utf-8?B?ampYRU9pVjBMdTdQUGc0K0hlSDdKdzh0cm1vNFR3b2JOU1pFMkJxTzUwdUpH?=
 =?utf-8?B?blE4M3pXNWQ4L1YzLzNDZW9nK1NkN0lxNUs0UWl2RElSREk4MTRFRWpweWlR?=
 =?utf-8?B?TWkrbW1JSENyakNBOGlSY1hzVCtxTmhWR0xkZHFyVmdFcGlOV202LzU3RTNK?=
 =?utf-8?B?TVZiWXJmRWUrc3JCSVhCTVNBc2hHL0FxR3VlT2hXMHFSdDhwa3JtYW5iWHFJ?=
 =?utf-8?Q?H31VXGWMMI8JVxWj1jK1cvdXjOPerS9LCBwwNvHZpjdpj?=
X-MS-Exchange-AntiSpam-MessageData-1: M6K45DKSx5CcrRuttrRzzW/fwuCqrJpLOo4=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 21be7f00-708b-468b-c739-08def7b3d888
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:21:33.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWC9LH28XkIyVbJT9Ri/Ymr73/dAD/ryuEAzoJhkebZslV2MDtPpwa/gSA5gc+OPJirgZAYti1SvxumZhKXpycLEWKE0UlFDEKoDfd5OYbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8271
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 14:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10269



On 8/11/26 4:16 PM, Antonin Godard wrote:
> Hi,
> 
> On Tue Aug 11, 2026 at 3:31 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 8/11/26 3:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
>>> can be used to emulate U-Boot, for example.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>> Changes in v2:
>>> - Address comments from Quentin (thanks!)
>>> - Link to v1: https://patch.msgid.link/20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com
>>> ---
>>>    documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index e75f42afe..f4ed9a883 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -8084,6 +8084,25 @@ system and gives an overview of their function and contents.
>>>          replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
>>>          the gateway address of the QEMU guest.
>>>    
>>> +   :term:`QB_DEFAULT_BIOS`
>>> +      The :term:`QB_DEFAULT_BIOS` variable can be used to provide a default
>>
>> "can be used to provide a default value" can be read as "it's not
>> mandatory" while it is when using runqemu
> 
> It's not? Using runqemu with qemuarm64 and _without_ a BIOS value (or
> QB_DEFAULT_BIOS) is possible. In fact it's the default behavior.
> 

I misread runqemu, sorry for the noise. I missed the early return.

Cheers,
Quentin

