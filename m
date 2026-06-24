Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFC7CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:10:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4509.1782299444713398024
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 04:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bGgcOR2R;
 spf=pass (domain: cherry.de, ip: 40.107.130.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbxsMwr6VpCi5PE+GTYiSS34POa+9m8mRd8HuGl0BVBTFGiy70Pp8o8icpE5H/kxOeNdu5F1x/F3PaOyeLVSd1zmPHjV5eYgf6URexWG02ifQOo2guiC2q/vUv4+GpDbc+1pSehumCZzFaOi1ohJmovndzzUQ0WFo3z7Kha6X8E1i3TWrEv8wfUvLw2ajMoAVcxD8DiKtPmogEiVDThkHcN+/TIxBBF2+oGg5nWusPGuZ0NIjvyQ30E2Si2A3Om2a/uTPai0HdvwTg+jlhY47OpPH2SL9Dr9ScFI3kL7SBqF4Yn7hFigOoRmHnUfKdyGHMEgp0EZF3CYBeZHwMlZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CDiQSxBYugtvEoIC0TrOqJXrzNCMrIgwbd6UKMkZPA=;
 b=KuRJIdwLBkpQC1OeLFjYk84sbfxqSL1oiju0eBDtEpi4Y1QmSvLT11BnIbIMTfFt2+/K9D4lWjpIyfBc0weMx4JFZ0PNXAIajy6SSIhbtKiDy0rCr2axCuZH93ARjW/YUPhfYO20REt/wuhEbo9fg6fUp/h5INL6T6WZRNZ9LNVtBM6cxaTgVoHknEBPoWO/yqrmIaxY1beaVrijdRzxBf3dXg1I0JrQEIGsF+yCFh40+Ry/4fN9thTwiVQ4ZdPh7QZPfe3RzB+8uELmo3xmevjqYdxKRRsJ15fvPWB29xy5SMi90cEtHzG1t8OJpj+yGKdiPOM0zdzrJAxUwHxklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CDiQSxBYugtvEoIC0TrOqJXrzNCMrIgwbd6UKMkZPA=;
 b=bGgcOR2R5o0uEBcnPuj2E3QOhsokj3vb93KKUaDNe9o2ZiqQal3sARmNQU7+0EoCIULMQStE4WrbDoyiMJiVsa2tvNx+ztluDCfs8GQeG4X93uv1FIZdmE0WAPg6nYls4HZl3HXw82j9UkdXXgFdlGiIFMlmR9+mxLgAlOYOOhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB8462.eurprd04.prod.outlook.com (2603:10a6:10:2cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 11:10:38 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:10:38 +0000
Message-ID: <b7b704a5-3b86-456e-8336-d5d7d21fd72f@cherry.de>
Date: Wed, 24 Jun 2026 13:10:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: add missing section on
 build/tmp/deploy/spdx
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Joshua Watt <JPEWhacker@gmail.com>
References: <3c5da9d7-fc80-7a9a-eaa1-4fb9eed25a6d@crashcourse.ca>
 <5860d181-e58a-42ca-a849-a85d1dccd8a4@cherry.de>
 <dd385398-0b9b-978c-1a6e-4fdd87685f1b@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <dd385398-0b9b-978c-1a6e-4fdd87685f1b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e2a151-aac6-4de0-4316-08ded1e138c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|4133799003|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uRwHJ9RZ+d0YrjUFIp7iXQ2rP4ZPI4RFKK4RBA65y8Ehx32Vg0l18CGKHqaVwnJ6pElPDmZpoexItndjfothGN757L3CVeOlEfYITswRazhZjGBFryDe/3vX5DGokWzJQhS/ldmvtjuPDZwwQiVsiGw3m+YODeb0BEEWZ6KH9DSbJktLQ2zVZfF3f7UUUHF78yKfald/y6rkhgr46yxMRyhvIrfq20vV1wWQzG84k2bjSDyoRYOsZ+15bj5J/lDmoveeBqCSy/5BTbxbyyhv4qdsk23SsS+WO8lFmlBk+0/g9XmmRPR6JAvdIzf/SOMef3EQjSzrZnBtS5Va3xXIl08ICBvbDk74brKu7ucbrNxHpkMa8rG1nZL6h8sfsOmeRwfVZeXU/ToclM1gtEM3kEVZUVEuT4UMehGE7dLfKudyeUphWeYW+ij474YTrlqUW6WtCWFQK/TfXIgf+6ITiD1c3XHBZdtDWijQKXX4nV5BPypzCtl9qMDotuLJtSYE04/928VqI4G5q2D+LUbCd6yLpDA3UWtyHJel6V89E+zezk0DfGVA5Ypeh3UFXMaCiMdgha4oLkXalrc2RovVsOaQmmjU/vCSL+1+0Iyy9WZN+e1kS8TdhN2lm71OKcoSoQuqh/fWpOGqjwU6oUmPvxGpxhvxPv0Bj/8DOUUpm/c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4133799003)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1YzRk9pV3JySFl4L2NwRTRpVUNVZHEzanZJMjFIZ3FDbHJEdG0yYVFrNE53?=
 =?utf-8?B?ODRXNVduOVZ4TTQ1Wk9iTk8xaEFTTm5JMkp3K1YxVkFYQ0M5SStWYTNVbWFD?=
 =?utf-8?B?VDlELzdzUUVJdWNPQ0NNajNwdUMrWWtkQ2FVeWVTNUp4aENheVJuT2tkSERL?=
 =?utf-8?B?QnVLNEw4a2xKQWJ1MzMwZ2R1bE9EOEY4YStTNkZvUjZEMkN2QWN6NVFxdENK?=
 =?utf-8?B?czZuTi9VOUV1Q3d5UXZ1OGRnMEI5NExudTI1NWg3c3pMSFBsQ0xrUmU4K0ZQ?=
 =?utf-8?B?OTdIdThYVWg2ZTB5L2hPd1M0RVU5bFNLSU0wU2xuZEhMeERmRDNCenk1RUpP?=
 =?utf-8?B?ZFJVdnpaSEVKK055NFVtek5tVGxPNHRYd1ltZjNCNzNrazhEQy9LSDdZVy9n?=
 =?utf-8?B?SVNiNG5LQzUvM3pOSmtnN0RoL1lLQWx0VERmYXRCa3pzUVNVbVc4TTlVU2la?=
 =?utf-8?B?eGRzT0pQN1g2Mklpcm16aldHRFdWS3hkMFJOSTVyV3piWDladEE2Q3RHb0wv?=
 =?utf-8?B?SmwvblFwclkxVmc0UDN5K0lsRUNSalJVR0owREg2aUxuN3M3c1JSeDdEVk5Z?=
 =?utf-8?B?SjBjSE1DNC9lb3M0eWtlL00vTzhIL0NUaG5wKzNja1FHRVhrczJDK1FzRUN2?=
 =?utf-8?B?S2l0MkVYOHcrUFVkVjc3cGZ6YmgvVmkvUG9NcUF1K25hRyt2THE0cTg3cDdG?=
 =?utf-8?B?QlVjVGs5d1EvZVR2RXBPSzlKdDNTait2eVhuZmhBdnpPb0JaOEJlMU1EM3gv?=
 =?utf-8?B?SkdGbUdNeGpyUEl6aTlDajZVOEZUaU5lSWk3U2RPeVBTZytmdXQ0MWJHNjlm?=
 =?utf-8?B?TzdUNXJ0SW1yakU0RzFoUS90YlNVdjhxd28wYTlJTjJ3Zk85SDRsYmlEWGI5?=
 =?utf-8?B?OXFoZjhaY2hQZ1JYYzIrU1daSWZnSlVRUm9QQTZoUnJ5bDJKMmVabzV5ZHFI?=
 =?utf-8?B?TjJhNFhZbEQ0RnlRTVVGNURtWWkrMGVHUjNmYStDTit3aWF2SStmS1Z1L2xI?=
 =?utf-8?B?Wk9WR210N0hhcDIwb0piRlBSS2dYSlRHWTdjREwrMzFPWEJ6VzlsakhTR2xs?=
 =?utf-8?B?RWhPYlBYV1dCNU1NU3o1elBWYWZuNnhVTmJweXVhcHc3U0ZrTDlaeFRBOUJF?=
 =?utf-8?B?SXRXL2JkUHg4UERmNFkrS1hJOGZOQWVkTUZoRk9VSnZhZHk0Y3FvMjBEdkdx?=
 =?utf-8?B?YTRLenZFbk5sWE1yK1lucWpPMkFZdjZmOHBsMFN0UDFEenNaa2NJMUp6UEp3?=
 =?utf-8?B?cGlDNWxsSXlTamowLzlZVVAwNzFtcFQ3eXhiaFM1VnV3eGVxejhzYXRydWpM?=
 =?utf-8?B?OWpzYTJCUVdkQWJkUHRzT1ZPaXdINzVtbWR2VTErNkQvT3NBTE9YdVFkNk5T?=
 =?utf-8?B?ZExjSUwrMUM1Z0FOOWhyelVOSjhVbjZzS0hUOUE5eTVZQk1jYWd1RWN6RUxQ?=
 =?utf-8?B?aWpLUWZzVUtQZ1lYMktsUmtRTmVyVEs4MnVVSnhpa3BmUFp5dEFJb3pRM0hB?=
 =?utf-8?B?eXFTb0pYcVRjZFhNMW8xbFlvNWhZWUNPMEV3ckRvaHMzTnlOZHFDZ3duREJa?=
 =?utf-8?B?NHE3dWNKa2orVWhDek5Dell1Zk92RnJVNDlIUUZ1UnFlWnk4U0doZ0pKK1RF?=
 =?utf-8?B?NW5RUkYyMTNFK29paEVvOTRCTElaNVpHVEx1YzZEaS8wSUNDczdHM3NGUXBr?=
 =?utf-8?B?cTBLVzhSNWhwR3JqL09RVHhMcXhNRjJaZmJ2akR5enFCS2FWZ2xlRmxpbkhF?=
 =?utf-8?B?WlRocHRoWUJvYVhCaTc1aXRadW5vaStFc1p5a3huNjB5dlUrWm1PYjdYM25s?=
 =?utf-8?B?dnRHNHNpV3B6TXhpaFFHVy85U2NvNHFGeVpkRW5YcS91YitTb2RtWUFnVGMx?=
 =?utf-8?B?NThodWRxczVtVmFlOC9TSUxlQTlxa2FNc3pkcW50aTRyUlRBeWZhVTVTZUlR?=
 =?utf-8?B?U2hRNkIxTlVja3c4aVM1MW40d2p3V0lXWGhhK2RubXd6OHBOTTJwVSs4bzc4?=
 =?utf-8?B?bThhUVdsTC9LSCtpaE42eUd0eUlGQnNmR1paZkNBcmREZll4Ty9JRE96dDdO?=
 =?utf-8?B?R1k4bjRvYU5yYU9Ba213NVFvNU9QV09hUjk3VFR1MjdYdWs2cHlhTkhaUFlU?=
 =?utf-8?B?aEZ4end5b3M0UHhERFpvYmlMSE04S3ZaaHY5NlRHbHFPU2dGZElOVytjUDc2?=
 =?utf-8?B?SFljeWE0VlJmekJTRWhCejEyUTFuSTVsTzdqNEp0OFU0MVQwM0w5T3NEUGlp?=
 =?utf-8?B?N1RQL2NjTkJDcnozYjVySnZ3bXk3ekJNOUVFdE9HSjFSbm5qTGJDNktmUHhU?=
 =?utf-8?B?QmlFaEVHMStDTmsxMEZsbVJsZVROT0lrYnRnbVE2UHk3VVJSTjdrUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e2a151-aac6-4de0-4316-08ded1e138c1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:10:38.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA61QWxbz4mhgKivdfkdvz8ADS087n5Jy17EAStlhSL4wX2EfVi7U/Evidbz/1p7gfhqg0QSk90q+8WFNPqhwq4QWNzNO6nilDSkL2YJayM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8462
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 11:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9864

On 6/24/26 1:00 PM, Robert P. J. Day wrote:
> On Wed, 24 Jun 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 6/22/26 7:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> There is no subsection on build/tmp/deploy/spdx; add it.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/structure.rst
>>> b/documentation/ref-manual/structure.rst
>>> index ff84b250b..e22de6047 100644
>>> --- a/documentation/ref-manual/structure.rst
>>> +++ b/documentation/ref-manual/structure.rst
>>> @@ -539,6 +539,15 @@ licensing, see the
>>>    ":ref:`dev-manual/licenses:maintaining open source license compliance
>>> during your product's lifecycle`"
>>>    section in the Yocto Project Development Tasks Manual.
>>>
>>> +.. _structure-build-tmp-deploy-spdx:
>>> +
>>> +``build/tmp/deploy/spdx/``
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +This directory contains a Software Bill of Materials (SBOM) in SPDX format,
>>
>> "a"? I have tens of thousands of them, in various subdirectories,
>> though I possibly reused the same build directory for multiple
>> builds at different commit hashes for OE-Core and I built that 2
>> months ago so maybe things changed since?
> 
>    is the question whether the term "SBOM" is singular or plural? here:
> 
> https://docs.yoctoproject.org/dev-manual/sbom.html
> 
> it's clearly singular. is there a better wording? in that same
> section, one reads about generating "SBOM metadata" or generating "an
> SBOM document". we should be consistent.
> 

/me shrugs

Adding Joshua in Cc.

