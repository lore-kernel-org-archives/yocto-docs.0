Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDAACF3953
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:19:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11096.1763569153535766566
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZfAkKzFz;
 spf=pass (domain: cherry.de, ip: 52.101.69.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbLN0+OmjGT5Y0aOXdvGVziW1+TiGpZynCMuaoIJ91G1dOpAfGNY8fB31v39X+m4IBkpXPJgcJfm/bnh7hF2INq8JIxr2S97OVJMjy7O6PHOyfZRsO3pbQjvKim2i7TZW2LsoBxdDl/gbE3q1O8VFdLLG/GaNbvJwODOZiYzEtsoFr3PKVnqNHy3njOsVsvgrMmrutYHEoyney+FghGE2+p3ckgP6O3TpEHHxdj/FOO9qthzEOl9VlghPZf+sQQUwLqxt5vf9HC0KBPX9UDcYMSo3Dn9I/2IBBz6Ecn3+kFD5tz3DkGjtvVvPfUWw47YG90BMnSGcCt1G78UVx7Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEsh+1dGFON4gY1Yo7lAQPgdbrl36ib6orEFkjzXhxM=;
 b=sCbnNth9bsTC8WHFARWwoJ9QANyy/K5aPZESmJgRZImjDMOVzMc2b5pfzEODaHgSoJqeTicTtuz2lyznNA39Y5TCc6z3ziNWbCdxPVQy9CDecCU2cKmMz2As2P9Cs/cQAuKzIE14x2cNwp9crEKeB9WSK3S4sYXjD0Iwacip9ittpMOtcvgbsX0ZQVFKU+/bD1jTRLTX1k3kqytLil7M5hSHZqjDosm/wNZmzgeYAlTXIWJpuzqVRSzew3qWOWe13DmqN+1vpGDexLAzJnqGpDNDgy564Y4zzstQlWzNAZgLHyQoSNqXkpEa1sVbq9xtzmUEHuQ+eq+H2ZstQotl9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEsh+1dGFON4gY1Yo7lAQPgdbrl36ib6orEFkjzXhxM=;
 b=ZfAkKzFz3Z0p7KQhh544uV3tNUNAIJoS1wzfAtmSK97zu5yBYX+g0X8hG/W5mz/5A+iyWCHuJ+xHEZp0fRDNe5qooBj34oMmqHGh639GG59b+28yTZ1ijF6IDxHQ9t2h0mNWH6M0EnT4RKxmcy1c07waeR+PEPwGDJPWIruVT3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:19:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:19:08 +0000
Message-ID: <9fb855e4-3155-4e57-b9ca-34c56c0de58f@cherry.de>
Date: Wed, 19 Nov 2025 17:19:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs: shorten and clarify required
 host packages
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <8a97eda5-0b39-03dc-1e37-76031a747f46@crashcourse.ca>
 <e84a32a8-2c09-40db-9688-340e96474cb6@cherry.de>
 <75c51d5b-d1db-71b6-f797-80e21f5033d9@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <75c51d5b-d1db-71b6-f797-80e21f5033d9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eaaf227-1e0b-435f-66d4-08de27875e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mi9KUTlFR2xLclpDQ2VoZDM0cUZiN2taSk1rZW1JNXF5SDhtVUttcmx4VEcw?=
 =?utf-8?B?NEYxRGpndVl2NUhZQ0VrVE1SVFlFT2NjTE1aOVZQR04wSUwzajJaNElCQUd3?=
 =?utf-8?B?SzYrNnVrT29nOStOVlg4WlFEYThWeDBBM2Eva2hyWm1HTm9QWVI3NmE4cFNB?=
 =?utf-8?B?dFJ4MFFQUW9iQmJkcTQ0M2pERGR0M2Q3azlEaWhLYnAyYlR4eHNhVFU5R2FK?=
 =?utf-8?B?UVN3SVZ0dEF1NkNMY3Q3MHVlcTFJS2dRcWJ0L1FySWhmU3B2MG5zTWRVaTlD?=
 =?utf-8?B?RUFDemFGbWgzU3FaZFhYUUZxOHlLbElHa2xORDhpaHh2cEZOSHovSDhMOFhl?=
 =?utf-8?B?a2hXM1JxM1MraXBGQ1Y2cEFDamkxZkJPT252RDBnN3VQajdFU2MrQUNacVd4?=
 =?utf-8?B?dm4yV2JmQ1lQS28vdUZwT3BjQktQTGZnMVZqMjQ5NDd5aTNhc2dXclRUMzZy?=
 =?utf-8?B?NXZWY1ZWUFBYcEdGdzluRC81bFplaDBENXJqNlhUQmM0TENzeHFjQkhCMGs5?=
 =?utf-8?B?UElNcWM4cFBlWEkyMGNSNlJ6UGxEWnNPYkJzOVN1cVFObHJ1S1JjRHFQOUlJ?=
 =?utf-8?B?WkpFbXY0UjdHT3RXOTh5SXYvWk5WQ3B2dW9qYXQ2dWRZbUVmUklBSTEra3Br?=
 =?utf-8?B?RG9BMURyWW5vRXhDTk1XQXNUeWxFNUVkUDM0Rkp3MUdjL1V3QitOdnpBdzJQ?=
 =?utf-8?B?a3loTmV2L3ZER3lBbVQydzhnbmxrNEp0VUMycUVqNmM4a2M2VUdtcnBZNmJN?=
 =?utf-8?B?WThaR0V2OStoUFY0S2VLVFc3VDB0WERsSzJBc0xVTmhQRjcyYU42d2VZT1lS?=
 =?utf-8?B?SEtlc0JCWTY0MU16d1k3dkJ1RjVHclJpS3lvcFpZNlp2b3JYZ2Z5VW80WlVt?=
 =?utf-8?B?Ty8rOWxybzNEVWtEMEVtVElHajIrOW4wZ2o5bXN1TkRlY0NVRWUraGJCT1dX?=
 =?utf-8?B?cm5sL2FNL0RtYXd4bW1oWUlMaXlzYW0wRHV4VWpHR1UzaWhieFZVOGVlMFlt?=
 =?utf-8?B?cnNPSmJkSG05SVNJWjdEL0ZkaEsrbDEwYnhCWEtrODExMjdVODU2anlIWWEy?=
 =?utf-8?B?dWtJYjRyYXh6RzhWYStnMGZ0VTVaaGQwWW9tZzlSRjZuR1p2ejgvQ1hGWDcy?=
 =?utf-8?B?dFdEd0VXaUhaV2FyUE5PZXdyYWYrWTN6T25McllJR2JvN0lEaHIwZEtyNlRR?=
 =?utf-8?B?eCtRelVjZmxaY0VPM05pc0tIZDVWdFRuaCtxaWhSb0lpdnBvcXdMWmhKcGN2?=
 =?utf-8?B?aXRuNUx0aWZSZUtSR1VFUjZsSnM1enNwZTRscWVXL1ZVOXR2Tk1JN2lFVkxM?=
 =?utf-8?B?eEJPMTQ5d0E4NzJDZFBmOUNua2xiN3pvd1BHSjZPTmJ5Vk8vU0V4RitDTmVG?=
 =?utf-8?B?S3I4Ti9aWmswOU5hbEtaSmpwbEpzTXNncitNLzhxc1hPMEdtVTlNME83aWRh?=
 =?utf-8?B?WjA4c1JNZGdMZDNrQzc4TTFuWjdNdTZEVlB2ODVnT3pXYkF2a0x2Wkd2K2pk?=
 =?utf-8?B?SnFDOXBSL3NIeGxBSUtzdDNhVjd4amc4UlBRTDkzaWFIbHVyYXlSa3FSbnl4?=
 =?utf-8?B?TXNwYkp2LzJJLzdkWjZsUDBDczVFY2w4aTh5RHlxN05MeUdaTWJDVHdYL3NB?=
 =?utf-8?B?SUtDb25TWWlzajZ3THVxRjNZT1VyUjVjR1R3S2thbmN6akEwU2NHeEVOVDZN?=
 =?utf-8?B?YzVTMkZQL0JtcGpkeGI5ejM2ZzNUdzYwOVVWcjNKK3hmNmVMUEhuaTRlOFJq?=
 =?utf-8?B?RUo5QnJmY0gzWnd2ZnZmYnA1b0ZPVVhqakJtQkpYMnpCSUpwTlpRT21JZHow?=
 =?utf-8?B?cTZWSGYweHdxWTlGTDB0THhsYkVWYmZTRzU3RGdtN2JrUkhwbjBMUjhOK1lu?=
 =?utf-8?B?WUZVZWFvdDcyclRoYlRaNmVhWXRNbS9jdkRCbURGbE1ZdzdIb2dITFZwemRY?=
 =?utf-8?Q?iJRraOryrcimswE4b+g7NWwBfeactOsR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dW5SVGRhaHZqaXRxalpJMGwzd3RKU0xHSkZuZ0piR0dqMFZheHplM2hqNXNP?=
 =?utf-8?B?TERvcDNLOVdTQ3R2Y3RaNmZnSm55RldjNXlzdmpqbG9JNXcwTHdWMWt1cEor?=
 =?utf-8?B?K0RhaU9wMUpweTJxQVIrNkZkRCs1aUwwbG5XS1ZhT3VCMGxNTll1SHBLYWZO?=
 =?utf-8?B?N1dDcE52S25SY2E0VXFwUGw2U0dtY1pEV212ZGR0N1lvVi9jSlNxdjliVDU3?=
 =?utf-8?B?bm5DcHpnOGN6REtvOWhVLzV6R0l5TFVsdDFRMnJ5UlM5RUVob29PaDlRN1dl?=
 =?utf-8?B?YTVEdjg5Z3RjMittOTgzRmd5NjgrajNSak1WK2FoK2dOa243YTdRTkkrbnNl?=
 =?utf-8?B?TGlSaS9yblAxaUFsOWFQSzI1ZkJZSllTeVUzaVcva013NnJOS0FCR1NHUUZQ?=
 =?utf-8?B?a1ZnL1pGVXg5N1lYVDJFU1dscGlRYW9uWitsVkMwZUwyR1pDMk1jbWUrVXBJ?=
 =?utf-8?B?QmhGaHVEaDJLNEVtQ0dKL2g4OFlqZ05ueDhyL2NkdjF2QzM1OUF4Tm9qeDcx?=
 =?utf-8?B?aTAwN281eFRxMHVwLy9oWnBNOHgrbzMzaFRhOHFVUUs1UnpiRFAxckNwS0hX?=
 =?utf-8?B?cXZ5QUFLSU5waU80WENCa3VnQk9WRnlWL2cwdVhMdTJIOFRQL2twT3JVTlBM?=
 =?utf-8?B?Y0JYaU95eUxVWGFIUDlSeFNuaXppV01sakRHSVJzTU1OejY0Z1k0ZkxwNTRI?=
 =?utf-8?B?MmFzVTBYaEsvd0cxNHRmQ1FKVmNqRDNHNTZrUzR5c3pPMklNSFk2MTlmQjRo?=
 =?utf-8?B?L0F4b2FEeUVBZWlZNmFIazhrUWwwaGxpZVlIL3hxc0Nib3g0cXl6cENqRVdM?=
 =?utf-8?B?NXd0QWhCbSsvZWNsSVJTVEREQ0tyb2ZRcjBaeXQxdkNML29mMndqNDd6T0Q4?=
 =?utf-8?B?NnBKRmZLTkJjdkI3TzJna2ZnbGtnd2pLWlFBN29uRTA1dStqVUh4S2lNdyty?=
 =?utf-8?B?RmMxUHV1TnpvV2h3cmlGVVlqWXVoWmp3eEhQZEdZRVlBbEhKcnR0WXpZc2RG?=
 =?utf-8?B?YUhtdVgyUjhhWkw3NmY3YW9ic2YrWmlsRWFCcjFpYnhrNlo0dzZMcGV2QUVv?=
 =?utf-8?B?a0k2aEZ1Mjl0TXc0K1k4Qno4OVNhUElZSkJhY0pMWDFqemRkQ0o4N3RUdDE3?=
 =?utf-8?B?aFc5OHdJNnlQWitWMlI3TmJEbTU2ZkVSSkVCQmlMSFRhTytUbmNsNmltRm9K?=
 =?utf-8?B?VEVrSFFGa3FsR1BBY2RQL0pMUmM5czhjdTRhclc5NzZzaWFwSjkwVXcvbHBZ?=
 =?utf-8?B?WUNvQkxINmxWZUk4eHAweHZVSzFHTWNmT2VNQWlnNUZBQTIzRzBMenRtelRU?=
 =?utf-8?B?S083UUR2cmNRRU90d1FGckhZWlovOEpWS0JzaEdYRHkxbUpLRGZ5QTdCQy8z?=
 =?utf-8?B?eTNEZzdVdVdkUUdDOENGdXNIY2hDWHp0MVZwQzdUMHovTThDZkxlV0VCekl1?=
 =?utf-8?B?ZTQ1YzFpVG8yRnB5S21xcHVzdlVkUXNVWFlIdGJQalkvbUx4UFphNkpyeCtk?=
 =?utf-8?B?Y20xa0NwZGVDdWNHdEFYSVVVU1hXQm1PMHBJNjlyUTJXZHY0QW95aFBWYmw3?=
 =?utf-8?B?UWZ1NjhjUE9vd2tUUmJaQTZrNmVqTmxqdGR5WFJWQktwMUswMFZRQ2VQajZI?=
 =?utf-8?B?R1VhQU9PdWswQ2RuM1hRRzFLcmtZRE1vYkRYby9uaFpXdzhnVjd0a1kvVGxn?=
 =?utf-8?B?NnNvR3lIYkt0SU9YbU9LZUJLNDM2Uk5FM29nVEc1Q3dFTzBEQUF3d1pnVlg5?=
 =?utf-8?B?Z3dEczJtYmIyUGVNb2luTDZ4WTN1V2V3cFc3bW5NdGhLQnFYSmNvZXBRbzZS?=
 =?utf-8?B?VkhHUTY2aXNlaEhjS3JLMXhtclBNcC9WZ3FrSGttTER2NXBJVm1RKy94MVdT?=
 =?utf-8?B?Qko2N0tUTDlnaUd3Q2wwajFrN3VBM1RIcFRMT2RyY3Rya1ZTcWRBb05mRjJk?=
 =?utf-8?B?Q01YT2N1aFpMRXlHdlVXNDhjVjVxWG5yNTlVUFhBT0lCbnB6amhHSjBiVFV1?=
 =?utf-8?B?ZUFVWWtGNkZqMVVRaGE5SXhXNnMxdmYvbHBwOVpXd0tOdU00OXU2MytqS1RQ?=
 =?utf-8?B?QWQ1VVRSYVZUcStnRGZHMUE0dzZwVVFKREtreUFUNU1DV3ovZldhRTBiK0Ur?=
 =?utf-8?B?WnBsVHFLNFJSLzdWUkRnMW5BTlZKUHMreXk3Skt6cmZnUzBhcFFCaGd5SmdV?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaaf227-1e0b-435f-66d4-08de27875e24
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:19:08.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN+nE0BXmsBLMOjRIiwA1vANJU1u+AhtS1SmaEW2xSAqrpUQ15FhshZCmtZrgjWQsFTGIC5WWsIVeI/kxE/5X6nOrMUkkpH9RYh3t9/PzK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8095

On 11/19/25 5:15 PM, Robert P. J. Day wrote:
> On Wed, 19 Nov 2025, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 11/19/25 2:01 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> Rather than refer specifically to Ubuntu and show an example of
>>> installing essential packages, just refer the reader to the page on
>>> supported Linux distributions and leave it at that.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/brief-yoctoprojectqs/index.rst
>>> b/documentation/brief-yoctoprojectqs/index.rst
>>> index 211b6d70f..36acd655e 100644
>>> --- a/documentation/brief-yoctoprojectqs/index.rst
>>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>>> @@ -71,21 +71,14 @@ can still use the Yocto Project. See the
>>>    :ref:`ref-manual/system-requirements:required git, tar, python, make and
>>> gcc versions`
>>>    section in the Yocto Project Reference Manual for information.
>>>
>>> -Build Host Packages
>>> -===================
>>> -
>>> -You must install essential host packages on your build host. The
>>> -following command installs the host packages based on an Ubuntu
>>> -distribution:
>>> -
>>> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
>>> -   :language: shell
>>> -
>>> -.. note::
>>> -
>>> -   For host package requirements on all supported Linux distributions,
>>> -   see the :ref:`ref-manual/system-requirements:required packages for the
>>> build host`
>>> -   section in the Yocto Project Reference Manual.
>>> +Supported Linux Distributions and Required Host Packages
>>> +========================================================
>>> +
>>> +Depending on your Linux distribution, you might have to install
>>> +some essential packages on your build host.  For host package
>>
>> Spurious whitespace after the dot?
> 
>    ah, the two spaces after the period? not sure how that got there.
> will fix.
> 
>> It's unlikely someone's system will have all dependencies already installed so
>> I think we can just lose the first sentence?
> 
>    sure.
> 
>> We should probably also update the note at the top of the page. Especially the
>> "running a *recent* Ubuntu distribution". We're often a few weeks if not
>> months behind after a new distro version has been released before we actually
>> do support it officially, and we don't always backport support for that new
>> distro version on older YP/BB/OE releases.
> 
>    what about "relatively recent"? that leaves a lot of wiggle room.
> 

Not really. Don't forget that people can still read the documentation 
for older unsupported releases today. What is "relatively recent" today 
isn't something we supported back then and that shouldn't be something 
we should let the user be confused about.

Cheers,
Quentin

