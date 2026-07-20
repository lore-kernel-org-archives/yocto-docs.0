Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15087C4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 09:16:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5169.1784538971472482008
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BaAKDTIj;
 spf=pass (domain: cherry.de, ip: 40.107.159.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsZSTOZFilmeHaDtriyzFhY6SMCii7dKvW3iF4jpS/BbfnnkjSYl1F1oZRqCzhsBvMd1D13ATpXr1WdK5b3rQmEIcN5Oh4X+PdhJlvfKGpgrlBWk6lgfI+ItwffXitEke3ky5ecgKMRSpRh7cwxnOTUlZRWpljN44c7puwtQejQLijQBjXbSps5iefkaj9H1DXMCZXVEkGbTw0cJhtJ09wCsRcRro5qy2pdTVu5f4ziEQn47HNd84QAMQbzrpEW/xxdfNUMxt2UcFLtlHqiogriorY3nlO9ftwlw2iRHmaXPTeB8msOUbXH+bdLzO8rQnSqwVgQJWXd/gQkgb//0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcmA0zVKYWnZ8SPT+UNvE7ymzuYpFJH4LYLN7gO9TKM=;
 b=P5MoF/yoo3F/tNvG7v+XJ4dhsmq7vzCCY0zZKpYCwvyGgrVWa5UGYd6kKLHcaaC5VEv5JR2f7w/a248cGMDxxr14XOt7Lvt87PZzGbV2TNW4UC+8WNuBWkhsgd9WCeWOY5PsUkIDkqStW9CzkRyCQoXH3V4UTXgOvhTiWH0AjVjfXPNqlMFIqkB02tof6RWmzMIilhJ83LNSk1Me482V0EQc0U7zbsDgDnrnlR1j3Xp1X+zwG0bNjAIdonZ5+3k35ACuFUJtpmlQ/h/lMNDWVHFnfa6MUH4LrXtEuRP8BwpbiIx5WUzQFse3nAOzm5tOgWd9S2GbKryj4+G7OcLYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcmA0zVKYWnZ8SPT+UNvE7ymzuYpFJH4LYLN7gO9TKM=;
 b=BaAKDTIjW1eOu5B3uJ2JMG4fnpQRIKtsGdYcCZ+TPId7jJv2MTJ6MJWZvCsdQkx0ErSo7nr+fhd1lcJGuOrvCcXYQsRdWHJ0qjOJ3pQW+UGEoVu9DYbeuV09FepI/tTfaLFCozrOnFWCco24qbuyY92Tq+9bxvtvSy53HNBsWEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS1PR04MB9406.eurprd04.prod.outlook.com (2603:10a6:20b:4da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 09:16:03 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 09:16:03 +0000
Message-ID: <68a1dd14-fd74-4460-b758-c0d8862df2d3@cherry.de>
Date: Mon, 20 Jul 2026 11:16:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/8] conf.py: add linkcheck builder exclusions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
 <20260710-linkcheck-v1-1-999168371d5e@bootlin.com>
 <a72acc48-890d-4a9e-8b22-5d02b5dee589@cherry.de>
 <DJZ59GPEP45R.20F3GW82NNSF3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DJZ59GPEP45R.20F3GW82NNSF3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008B5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68f) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS1PR04MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 09796a93-bc28-4d39-d07d-08dee63f8566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	YhceX184XJLqW5evkS2r5nmC/9xzZwrpvg53+KZ6wNh4Dqv8Wi9lhnkxjF+qqQeIbtUhAHu/5+eGM1QSZv9PlS21MzBdSuP0LJJXsho82sW2t5xgMndukKxDAG8tSDItbg9DoRmTtm5lLEXEHaony5VKkKbAYGF9ZqOVbsFLUE4STbJzHDAi9Lfh3XY6tmodGTuCOL+/xM7EZDQpHrOmpPR/KgQ3Asd2jPy8EVXZgAx7kKJNx56/f3xGFHmobeURuhyjLKH1Gu2n2cg2TR8vdUHxPBNWx8d2R9QR7IzvIuFqJQ00IEkuw9vhkNcYH5RhmbqlZPAkQefX8Ar6MOJkNcj+CZ0Xon2o7st9qhIydjFGXFFO2O8JQhMU1E/u2H5xBFZpqLuEGzgogoBQYABqMLtlIi9lrfqlwwiiTnUy8gyNLb9zHQzEk3gOX0NiSRhhygYSOdywtMSHU6KHrGV0ZY7Cy8oq9ddeek4fuLztrzhlrL1FPkwy84bfCtAob1TGoNRZCjlddfD9QXuXCv2XOKmaSE8BkiEX1i/XQJQgDn4gvV+7YKD/g4WdeIn4HGQIyf5EQDK8DborJICahEuCjkpTX8r7dFWExv+HetBN+7YssmYAlxGTJOXSgMeNpVgwaTPgvEglLE9wkm6PxNzwWB2z3m1pdNVaAJDO2hfe4lA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UnhxdTl2YWVrdGpVTUVxak9hUjJGNDM1TlJDNWxQakZqTTg5RlhhckttRVZw?=
 =?utf-8?B?RTV1cnlHS3MvV2VOT3h5R3dsbXE1SGNaRGt1OG1UQTZlbHg3WVI3QkFYeFhQ?=
 =?utf-8?B?cmIvbm10anRDaDlBSERNU2s4QnpBVWk1c2x1Rmo1L3QxTFRNeFpCajZtVzdq?=
 =?utf-8?B?U01RRXJsTXJ1bExZSVBRQk04VVJLVUJOSnFkNWF3MWhwbFRWZStSaUZyTE5J?=
 =?utf-8?B?R001WGVZejVxZHA4bDVxWDRQb3MzUHVVZFZpNWZrTjhDeTFBbi9hdFFpSURO?=
 =?utf-8?B?RzBOMjRFL3lTV0pmSm9UeExzNjlCcnhvS1dmckJLZVM5ZjdaZm9mZ1hpNlcz?=
 =?utf-8?B?R2RodFE0aUgrbHJRKzc1UENiZ3V1dWcvWmh3eDhaZHR0dGhEMlVkODZtMWtW?=
 =?utf-8?B?YmRNNndaYjBvaHN0Z3NJby9LRExiNGhVcVQ2d0s0TUNDaVJpNkF4Qktscld2?=
 =?utf-8?B?TnlaWUwwRnQ0SjA0eWdKQnhRRDV4UGZvSHd4RVNLSENGVUtzRVJzVEljekVX?=
 =?utf-8?B?MXE0QXhmbTJyQVU5aUNpZ0VwZkhBZG5QckRyUE9nckRZVGxtVzRPbXdZcjhi?=
 =?utf-8?B?YTIzR3liaitwM0huUXFSK0p4N0NDUHhsU0pjWks3OGJqZXp4Z0wraG1FZWNi?=
 =?utf-8?B?Q3VWREZ5cnVwc29LcncrMThmRG9aS2JjWUwyZDZqQ0N0VjU2d0xmU0s2VU1N?=
 =?utf-8?B?SDg4Nndabm05NEhCd2IrRHVUZTBxeDRtT2F4L29mOExlWWpqdDJZWExTMkNY?=
 =?utf-8?B?SjJFN2VlQnZKdjRSbHFoQ2VWVm91cnlkNW50TTk3Zk5XLzgrVHpKRWRYd2pZ?=
 =?utf-8?B?cnprZldlbWZSakx6ejdGcEg5SlpZWlBxajk2UHNCaGR4dTBaVjVjWXhHdElv?=
 =?utf-8?B?N09sODA2ZlQ4UTRPUXJZOUVoOENIcVJMYSswb2REc2w3TTRxK1NEMFgvR1Rz?=
 =?utf-8?B?ZVlwbTk3ckxYbnBYQWRiWCtJUlFaV1llUGw2MjBucSs5ZkhaRHRxQTF6bmI5?=
 =?utf-8?B?TEhzS2t5KzlJanJoUUEvSlZJY1h5ZXZBZUFpTzEzK3g4TUJvU2tNakFjaDB5?=
 =?utf-8?B?LzZGdm5ZNjJuSVdmaWFEUlhwMFM0a2ZKNXFtOElveWcxZXF3WndHbFFNNzN6?=
 =?utf-8?B?anhVekxDUnkveW1xcDhGQXBGa205elFBdTZDemdXZEJGd0F1aytMRmR6T0cz?=
 =?utf-8?B?V3E5RkFJK2xIU015dm5GT2ovY3E5SVo4OGZ3djhIVUpuNVhWbTFWTExOeFZG?=
 =?utf-8?B?cVplVnJhK0x1UXVXbTBocjVvbmU5cU16NzRZQUk2eEI0bXpWTGluZmVFVGVP?=
 =?utf-8?B?RkdmWnVPYUxKaEZKMVcvZjNSR0lTMlptK005T2VQM1hzWGZaSWppOTJ0NEFX?=
 =?utf-8?B?Y09EZlVvN0xacmFrMGhTNC8xdm15S21YcnFEMGxxbTIxV3B5WEJRWmtFd3hS?=
 =?utf-8?B?NXVvbldHbk1XbHFFOGFneWI5aVBBcllKMU9ERkd6cWhNQjB2WE4rVDEzcTlZ?=
 =?utf-8?B?NEtkS1JPamhOdTVuSVEyVWREa2tBMnhmNmRrYUtyMGpNVlh0cEhPWWZFOWVT?=
 =?utf-8?B?OElvcmFOVnlOeEJkWVphb01HYWI4eEtjTTExajh3TUxoazdPazlScVIxVDd5?=
 =?utf-8?B?VGQ4eUlCOHlIcXBUUW5jeWZTbFpIRGlGQnBCS1EvbVN0U0R2K1kvcUZ0UW1y?=
 =?utf-8?B?T0NLZHJ3RVdteHh6cE96cFhycERxRGowQWxSQkNTVFR5THlhbEZqbWR4ZHlI?=
 =?utf-8?B?Z2FGd0RkbXBsK09VYmYvb3ZnN0ZVRi9iT0ZITkx4UmRsSDNEMG5DdVJacFBF?=
 =?utf-8?B?dU0wc3pyN0xNNGtiTzloVklXRkNuVUdoTU9CK2I4YkNNWTFMT2luRXNrMGs1?=
 =?utf-8?B?MDhsQjVqR0hWTjRpVm5BbWJVN3Z6dUhWQWUva09wUEVkQm0yZjJmVmM1ZTM3?=
 =?utf-8?B?MmlRdzd4QjNlaXJyMDhNakY2ejlybFA4bFpNUGFZcm54amxiaGJtTlFWWTVE?=
 =?utf-8?B?YlFoODNuZnUwVFl2UTcwWkhYb2NUMzZ2bm5WVnpBZ1A1dWF0dVpEZGl2RUIz?=
 =?utf-8?B?T2Y1Y2FOd0xTWkRGYkt3cWI3MWg4cy80bS9WUnlpYzdBUzVIcE44MEp6OWZx?=
 =?utf-8?B?SXBIRXhSYzlNb3ZBTGdnU2pOUloxaHZma2RETUFEN0lkcWM3ckd0RkZiS2ZX?=
 =?utf-8?B?dXZ3WTUzQnhmdmdTamVmQ01XcFhqRmt5QTBEMzZ3VXZMellvQWF6b1hzdDFR?=
 =?utf-8?B?ZHcyQmVPOFZSb1U2NGFJZkhubDdka2NTZ29hZE5NQkU2cjIyZkRFcU5KWWZQ?=
 =?utf-8?B?bUN5VjhwOEdFUXFPcktBek8vVGc3cDVlcUhOcDRHZjkzUGlpWUdVUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 09796a93-bc28-4d39-d07d-08dee63f8566
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:16:03.0193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiC10MAao6IDjEPISuPwQXtzCQuYc+TlPOjj0fdwR4GttmUctCrp9m1I+C2QtRSKX/g/UJ5rNHLxAd39K8clCH671ZmJ6VW+gLGpQez/aYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9406
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 09:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10095

Hi Antonin,

On 7/15/26 2:30 PM, Antonin Godard wrote:
> Hi,
> 
> On Fri Jul 10, 2026 at 5:09 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 7/10/26 4:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> The linkcheck builder can be used to scout for broken links. By looking at
>>> the output of:
>>>
>>>     grep -E -r --no-filename -o 'href="http.://[^/"]+' | sort | uniq -c | sort -nr
>>>
>>> from the HTML output directory, exclude links that are too frequent.
>>
>> Because they are too frequent it's impossible they are broken?
>> Considering you fix links that are in this list later in this series, I
>> don't think this holds. At least provide a proper justification because
>> "too frequent" doesn't make sense.
> 
> I see your point. I did not want to hammer those websites, that is all. I'll

And that is absolutely fair!

> drop this patch I think. Maybe I could add this but commented out, in case
> someone also wants to apply those exclusions.
> 

I could see it being disabled by default and having an environment 
variable enabling the check so that we can quickly run a check at least 
once every now and then. Due to AI scrapers, most websites now block 
bots and linkchecker is seen as one so we'll also have a bunch of links 
one will need to verify manually...

Maybe something like:

"""
linkcheck_ignore = []

if os.environ.get('LINKCHECK_NOT_NICE'):
     linkcheck_ignore.extend([r'https?://nvd\.nist\.gov.*', ...])
"""

Cheers,
Quentin

