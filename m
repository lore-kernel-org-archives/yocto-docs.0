Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28024108B915
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:19:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11251.1774009149986286165
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GQCmrqHV;
 spf=pass (domain: cherry.de, ip: 52.101.66.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTgyyKbF64ZQL0XC/XMWyfnttFSPJ45L1EtpsuhH0Ei/ivh0xGjNbHcHsbZo1OQ1sJcQhfwqgYyWHmo8V7ckoVkc7mXJkMvhyzEh/3fiLU2pIKCkgaNHxXgzf5KfWKbYvIdTuIM8YyI+LDnqH/tsjlBsJF941M7TQiPhkmiGK91hmECnVz88KOngXf/86hWSYDwnd+nVfcbYJbUaHj+IeH9SAxJp7zi9de+15MuVmEKiuj3UwlTOYMKpe/3jYmUPBxNxswGDmUA0q1nVJOMOkutCj+ceGEspN/SdSeNmeDdhqCQ6OUD0Y+5jaWq0VTEOC6Q5rDCNbXaOYcyhTEx5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzKbj7mjjqMJaHVR09Acx2FMsaBcAREc43Lla23lW2Q=;
 b=RS6NIvbLnPvYIBSD+GkYvO/6F7EgZojzA2P7Fs2F6AKdeO8vVyuB4pO9BoZbC2rngTA3wHgz2aUq/SS55h1Wl8cpcfyRaI0GWBAKRBEHarX4wj6lpQcNU+2hkDjS+ivKYSsfcs2NpJob6mfMu/29wUYS3vfuESghBOb3tyKaJvSZKe3CLBlXvcjQTAuMdyARtJ2DY0PhVITx0kIhzKlhUWiu8cu7cMD474wcvL6CKXsMmAtRuw6wEIAhPh/qutm/NmThpgniZpWGwzblwUhvMYNJ5tMCJVQAZWEJrYtXRDBy08u5fHmKIwjb+AD3Mr9U4GtKbAIug+l7kU7WXp2sZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzKbj7mjjqMJaHVR09Acx2FMsaBcAREc43Lla23lW2Q=;
 b=GQCmrqHVsqUnPm7clmOsO1NjtJX1xJ+B8WdbAWqi2XaaG3LilyDxzFElK4fT4o5YXDJcGMsGq/lp+igIJ7B9gKLPDAZ6uCfmqUuR7Ju03Qy0nMyatvbrSB6sUxhV833+9gXWvVFfRLYFw4F+2hCcd/biPCneJBlGnPdeNHPUllw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:19:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 12:19:01 +0000
Message-ID: <55807352-b0e9-4551-9f5b-18710c7a8048@cherry.de>
Date: Fri, 20 Mar 2026 13:19:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 6/8] migration-guides: update 6.0 (Wrynose) release
 notes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-6-9662dee58591@bootlin.com>
 <d76013e1-535b-4cf8-a83c-11a1cf093bd2@cherry.de>
 <DH7JQPJL9D74.1L6371MBQQPAJ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DH7JQPJL9D74.1L6371MBQQPAJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: fccc5b4e-d27c-4c50-6e2a-08de867aded8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	4GfkUAeleCD+rWGvCn4MrD4l8eqDyy+mdzsV5SC/0etHMlqAJJG/mM8AD/i0czCNzM3jB0O0vc6fBl7RrWJyrjCYxzczn3mmxaDqfPlUSb5N8Tr3rAhrwww30kha3NplgX6EH/3JOKNYHrAMy+W/KNEh81TN0UiQiYGLJQxV4Xe6WqlBKSuWDb4UUOXBBaX7PBuWlJnGS+wgYTLtTlgs6SmW4Bqztb7Kw4VxOnyRw/QTkaDrvQH/6QrmtutVVNybY1+WzyP28h0L8xCyfAcGkjs3bHnez3fRLzr6pt06PLq29YDBLOxQeAHXScr4u23YLoQE251PkOvL2tSpfPf+IDk86INUM2xuFTMaYawumCnkL1mHg5pfBdGko5VrZqBKmBGXbLwuuIwoPtCTi0BUJpi0achxhFhYWjR/CM/xTbzYbqBsuNkVI/pvEw5OCWoQI8uF66VQbPFuwS30alC0t+Op28g3wTJN9+m5FYkCYW6snWvfLXAVzvVuiwzwqvF+AgadoHQ+JqPOV2Do8JHhA5Fc7F+gSStxJBLVl1Yh9ZoE17l2wJlVqs7PiaCNmgmtIC7sK4qs6l4c6uqHdRxUDIqvEL5W+Dd+w3PxeT0KXudihZvfui2sCcBXiJqQsKHoUR4AnhHmjj2N4nXvg3gLsLuhL3D9jJoEwbhQvzkLRtZ7wMN7H77UwYSmr5gmQkUl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTNkSEROdnN5bmV0dTc2T3pXNEpqUVE5R1ZBV1c3S2JjMlYzSHB1TlZINkx6?=
 =?utf-8?B?cnJPUUdzUE9JRW44cXVYYi9YQkhkWWhQdjlGWVc4eW8vOXl6Y1RVU08rOE94?=
 =?utf-8?B?Zmhxa2JmN1dIdUgwUVFndkxJWjBodUFxVURERUsrVXphUVdBeWFreHVZL1Jk?=
 =?utf-8?B?citXNVl4NXFCWkY2dEZnbjU4OHVuK1d1d3FTN2ZUVk55Y2JISmxtUFJvQzhz?=
 =?utf-8?B?WitVdVFKamVVVy9xMmZ3eXU4T0NLL2VuaHcrQU9CY0ErK1RCSGtleVZ6Z2FO?=
 =?utf-8?B?RU1sL0cvK2l4T0I3dkcyYmpHRnR6aGgwTDBxQUM5UTcwdlhuc3dxTFZuTHow?=
 =?utf-8?B?TmpadjVaYTBqT1Qxb0szMUdGZTR6eWtXbEt4dzhYS1NLS0JiR1ptN1dlT241?=
 =?utf-8?B?cFdnT21MeXNIeFZYdUVFdmhtNXZrVUtkV2hWR3MraS9SMkVTaGc0SXZBQy9j?=
 =?utf-8?B?b0gyQXhXY3VHUmZVQmM0UkY1TmJFbFdEd2s5NGZFd1RVeFFIYS9mY0ZBOFVI?=
 =?utf-8?B?Q2ZSeU9xWTNVVlN3c1RDeURwU1BjVkc3MU5YMWVGaDNpTUFYV2Y5SHpsdUVl?=
 =?utf-8?B?SWlzWEczRkI2ZjE5UEFFdkN0bnRGSlVuVU1XMXF5cWJwREQ5dDQ4RDJ4NFVk?=
 =?utf-8?B?SFJ0Yi9MeG9SYlk3VzhYZm4vWG5VQXVXWjByWG90ZG15M3RQUS81azRqVlJn?=
 =?utf-8?B?UGVsN1ovbTh4Y1hrZThwU2VFb09GWC9WWW9qcEFndnhQK3BtUU9RY1dZc2Ju?=
 =?utf-8?B?NWoyZlF5TG9XeU45WnRvTW1rNnJEYUQ0REU5NjB3dXh0cFVXU2h2R3VBdjNx?=
 =?utf-8?B?TFNRa3ppa2JUL0l6cFJvUjBGd01iU3h5V3JPWThmMXBJbk56aEF6YTZ3TS9D?=
 =?utf-8?B?TmhXR1NwRFlWUjRlYU1mMWFtbWhqNmRHMjFSelRKdEs1Z2RFbmMzWlJsTUR5?=
 =?utf-8?B?d3oxSWc5NFU0NHBtazBUYUdqa0ZpdWJTVExScG5SRitRWXVEbGZJUDRUV0Js?=
 =?utf-8?B?TmRKYlYyaGtKV0R1V0MwMkhpdUU5Q2ZFY3l4VUlCSlZjclpRckJocllwWENG?=
 =?utf-8?B?aDY3dmg4Tzg0Ymk3ZmxTVFlITWRVWU5LcUtXQmtlMVVYek43TkIrbEpkaUhp?=
 =?utf-8?B?bmNTK0dzNExUZ2RxWjRTSmo5aWxoWXF0Y29Yd0dUeTd1NU5JWWh4Q3hvZ25q?=
 =?utf-8?B?UDAwbmFUMXpsTzBETXpJLzlEMm5BREhsSG54R2ZOQ2NnOVJQejZhT0cvRGE2?=
 =?utf-8?B?Uk9KRlFyQmYrdjdXL0dkKzM4REtXYjdlS09YWlZxUUtoY2xpUU4zUWovKy9B?=
 =?utf-8?B?Vmhpa2ZVc1Z6RnJyR09HeE9lOUNxdmk4U09IcktJeFV3TDBaTTdabGt2VHR3?=
 =?utf-8?B?M0c4VUIva3FjT0UrV0FUZk9hZlBncjR2RXdiTWJNMXJhaXVLZ0ZMSDJFL2VR?=
 =?utf-8?B?SXNpQlpPWm95S3cvNjArZDN0SERudW5vRFN6MXFQOGQrYVpIZDkxclRVRng1?=
 =?utf-8?B?K1VwbzZuWStCSHlyUzlvNGx3Q1V5SzA5b1dBWWR0SXFiRjF5NktVRU5mWGJH?=
 =?utf-8?B?S2VsbFpvNTdPNG1BS3U0ZmVqVEtadlhKMGdPeEJ6aGVUeEVNeFNEVjhrSHBU?=
 =?utf-8?B?T0QvdjJKUnR3WVhTYlhxb2xTcmxTZW9vWEJCM3JoNXVjVXYySHZGWXN4YUhE?=
 =?utf-8?B?aGViNmRwNUpLYXZnOE1KaG5XOXprMWxZeTZjUk9vTVk4d0VUZS82ZTE3U2pO?=
 =?utf-8?B?WmlYbUdPMTJxUjdubU42d1R0ekhyc0dEQm5aV3c5SFNHd3U4ZUJ1OVdjcnJx?=
 =?utf-8?B?dDNza2pCZW5uWng1Tkd2M041aS8wbmdBM2JTM3oxYm9YSFdKbVFQM3JvaFhI?=
 =?utf-8?B?UStpckxjNGdPeWZpYzNXZUU0MUo1dHlwL2djcXg3b3UxYVVUS3p4ZnVZdGlH?=
 =?utf-8?B?d2orbjRiV0ZHZG1jV0JxTW13d3BZYVhVSnA5b00vYWlQb2JzZllPdSt0Qnlh?=
 =?utf-8?B?eU9oUll5ajIwNm1PWTZCK0QyV3oycXZmVmNpRWd2QVlHbVlYdDVaZG1VTHY0?=
 =?utf-8?B?QTNSMWR1dytsQWNkUHA0OWs1WW8zUXNaUEZ3WCsvdEY3U1NrN042ellPTWJE?=
 =?utf-8?B?N0Q4TDFXTGZvU29QS3VhN05yTDN1VU1tTXh6L1BLbHVML0R0YUF2VUZCUjZQ?=
 =?utf-8?B?NldaeWRyR2RUUmZaK3VoblB5eFROZDNlcEFLRlhUZUpaSkhHa1Niemd5L1hn?=
 =?utf-8?B?cmlxbmRXQ1I3SGtiRVI5bEF6bjZOUlRIKzRrbVlXSjRXWDdTNHNPeWZzN21l?=
 =?utf-8?B?NzlnSW5PbmNLa1pHNE9FaWhFTFZ2cWx0bzBMSHo4NFVHeDFVMWZ6Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fccc5b4e-d27c-4c50-6e2a-08de867aded8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:19:01.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0MtZdl7QAXHE+C/EIN4XZLjedlIfU3kPq2FZEdKq93GkD3wliegCqL6SmJjk9g8U4IreO+nkrTTZGcauN1c3rXBlwM5HWyHmv+KgNHveSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9448
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:19:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9110

Hi Antonin,

On 3/20/26 11:44 AM, Antonin Godard wrote:
> Hi,
> 
> On Thu Mar 5, 2026 at 12:42 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>>> +-  Support for the `CVS` fetcher (:bitbake_rev:`5427500e4f23`).
>>> +
>>
>> Missing verb. I'm assuming we want "was dropped" here.
>>
>> Also, I'm hoping we won't have sha collision on the first 12 hex digits.
>> Wondering if we should't put the whole sha instead of only the first 12
>> hex digits?
> 
> Ideally I would have preferred to be able to pass-in the full hash and have only
> the short one be displayed, but I don't think this is possible with the extlinks
> extension. If we come up with an idea later, I think we could always script

'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%.12s'),

It's not explicitly listed as supported by the sphinx-extlinks docs but 
the code does

caption % part

c.f. 
https://github.com/sphinx-doc/sphinx/blob/master/sphinx/ext/extlinks.py#L115 
(and seemingly always had it implemented this way, checking the git log 
of this file)

so you can have anything valid for a variable that is passed to the % 
operator on a string, see 
https://docs.python.org/3/library/stdtypes.html#old-string-formatting.

Cheers,
Quentin

