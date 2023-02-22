Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5432BC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 13:49:07 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.81])
 by mx.groups.io with SMTP id smtpd.web11.9126.1677073745923153406
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 05:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=a+KQYO7h;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.81, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbpWOPW2ZniRPZwUj1ZOovQehSH1Tg+jRtd/K/vWygrdgH+r/ZGMWxe7uV7/dbzrXbH6Yz0RVzEeS3EVbj8j84oD1FeNqwFHeWV4Xrc3V8MvGXut/NWsLykINaG41l/FWCvCZACPS2zRWw9DdwTfSqBvJ7qirjTpBVss3MI3RN2K/FPnEWAqDo/9Wn8MJrCA2ZIXddg+bRSK9x9NuHVty9ZCHgziRqlPZahTGmIEgXQQB7yq5qThtUdD2Ad6vr8jawjPBABw/vpO3pete72LEOYAUQCvSV/Mej2f5Cm2Md+XgKfhTBG757/DWg7CKGYJPG2UnhPhyB5831p7FhjV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hfNZIEhNOxjziVXKVM2dhaTIEHDN83I+36rQMDTI4o=;
 b=Xx468uItegttuMLgBGm0aOjh7lOXZ/n62R2FyXW9qit8rIVEJ9ID02UaUCs60VbewyooTtONLCqg1upAPhjD23mrp2+3kWEbMLXUhloiPycO5cAqhRwmw63pMDwSm3uisHhigqXlqAvMTan1kiEmDgBP/cBTt6GQjr7xcZfxf+p4L487XKow2beQPlYGQvgVl2Uwv/A/KMKPs3eE/FizOoHk7M4hES0Zifa37WfxTmOq2ZnMv/SXA0VUl2NTP50beAgiyDTokdU6Hai28OWbjK3IGXLeWt0lh4hqv7YymLGNk8Cl41FVwEeZkm0pdVDeObjBflKNfIOMYRNONpcK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hfNZIEhNOxjziVXKVM2dhaTIEHDN83I+36rQMDTI4o=;
 b=a+KQYO7h37AAqiD7q32K1wC4mXv6kQhrOTU8giQ5+UjmDduey0UejYXQXF/81Tkytkm/D37ymd4ShM1IBxCCPXN0a13g2N8cuc1ZkmpBxOBw2WlY2n4x0pRB/1XOHe00Mo7yDRzFnaJVifeeNQ9fNrSq+J5X2+DFHcAqlqIjEvzWBOMawMY4k+i+O8nAH5AVcvHTiDjgAqDcm4uHPefW22OQGrYeMiv+UQ8wYA51l8N0T1UPidiiJFG2GdsybZ+7vlwuwxcV/sYsk0GHI8L6aW3eYgaWUsb3Jtu3YEErY2BMhaI9v3BfIqNRU/s+6PbIiFbi9SDJT7rCBERFuTuDrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 13:49:02 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6134.018; Wed, 22 Feb 2023
 13:49:01 +0000
Message-ID: <9a2b7892-fdd6-362b-3950-5c216dd3ed66@theobroma-systems.com>
Date: Wed, 22 Feb 2023 14:49:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH v2] manuals: document
 COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
 <20230221184156.65816-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230221184156.65816-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 943a6ccf-4bae-4a4a-cf4e-08db14db8e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q71zQSvRlCWA6/lKEWa/mcz+EIGeaiAfjHKbdwLWRPM11OQIb3uN1yvfNFzXmUUjKTWEXSnFMRFYK1QvEG/+YAY3ZF1HC+85y3TsxAUCDQJERUJbbdSt6ORrO32GngHwu7fIcfVA1djfrSK0h3NBZIXO7cvTZ3DoM/J+Yf9wiD78lDj6pJpRbGzxTnPu3dNIQDr8W9/TQBBEmNpVkO3kgC+zcY973w278Tvvs25xijfUHL7FD+Y/F5nOUzPwQZ6CHz0Iq+5LsHmMQsPXNBdkVvg1gGXyPdsv6gk4IhO89tWX5t8PaDQYV07ITh/S0/MSpiPzFEady4BqmFaWi+7N/q2NUH4EBBCXcSFC/RtyvyJtJfT/yH0WzMBjsTrTM0IfmQVRjTIBjm9yLP0WCu4OvsnHLcVZWORqKY2ARO3PQ8uoO8AyhxGKTKH4vTOwSgoGO/2k/8mz4+TV7bHZ+KjQEsZw0jUfx5Auxm7shfLhpFKLnO9cwTw/nyx2cKPOztyUCXzoWTr5pewWQBb8TNVbZk1nGozgyPzU3xEYnGrxSZUidVZcRuKSoxOwRqULYtuJO34KY9RnIVzIPKzFQJRvohkvHpxfPHbye5qDOqV9XghBbAP5j8DFMeFOnJsISsZcKpQrsTjTYhzILnyfNYWr+3sfCl5QVBIBYNdMhjYuXeF6goB0UWZ0AzjorjTSR10uh1NGO/DLTJMVAWyUUESaO4tk6Y46o/nvVpsOJiN96obtg4bUescbvjqtnYrB2/o8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(451199018)(36756003)(8936002)(5660300002)(6486002)(478600001)(66946007)(316002)(44832011)(66556008)(66476007)(2906002)(41300700001)(38100700002)(31696002)(8676002)(2616005)(86362001)(6512007)(186003)(53546011)(26005)(6506007)(83380400001)(31686004)(83133001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmtiWE9WdGhDTTRtQTIzczF3NzI5aG1WTndlS0NHdERTd1UxR0VHRnVFbnVt?=
 =?utf-8?B?eThQR3F6SEd1Z1ZlS2JxZHY4dVZteFFQcDJTOUd5K3ArMkpwb0Zoemg4SnNy?=
 =?utf-8?B?KzBWd2NnY0RlYzIrUVhXSmFlcnJnOFk2bDlpZ1E5VjFOMUhKdk83QUlGanhJ?=
 =?utf-8?B?aGpwY251RDN1UUdFUWFGNEdQSzZhaTIxcHY5VVRWVHF1aXlSeW9SajZQTjdX?=
 =?utf-8?B?eVRSWXRhelU2TlZDUXoxRC9IcGFDR3E4amlZSis4L1BncXRpbGYyYjlVY3V1?=
 =?utf-8?B?NkR2SDNkNnBGOWs3dDc4K21vNHg4T3Nwb1dXYjl3SVcwWXhYVGVoLzhrVk5h?=
 =?utf-8?B?cmpqa25IcGt3Tk9OTklldzdvQ2dva05FaTYxTVVQVWlYZ1h5WHhvSzd1RGU0?=
 =?utf-8?B?SGpmZ2w4SHVwZWRZNkhPZXdnTFFySXZqYVRESG5zcWV5c0dIM3RjYUFBVkhG?=
 =?utf-8?B?ZHlya04yc2ZQZHlNaWR5Q20vUGJ3SUkwRkJjWEtRKzNaZWxjdWJaMUtsU0ZV?=
 =?utf-8?B?b1hDLzF6bkcrZDRJcDkxZ2NQbkJIeE5meHZ0MTA4UjVFV25aMWtPOFlOMmho?=
 =?utf-8?B?WW53ZDB0bEowdWZLTHc0YXpNc1dRVjdRS3RvaGY0TExkamQ5SEFIRzk4c1Ur?=
 =?utf-8?B?eHozaDh2aG9MbFh5czJxUDlrUTd0d1FCUGIrSzIwaFB5c1U4MENOSkh0Nk5j?=
 =?utf-8?B?OUJVakdaNkx1TVNKd0JJcHJrVnVjRmJlZ1lVaURRRTJCV1hjd2ZmaWwvQ01M?=
 =?utf-8?B?QTFXb2lVYzBSNktmNHFDVWs2c3E1Mi96MStKQXBVOUVJaXdQNlUxMGpPcmlk?=
 =?utf-8?B?bVZvYVY3U1hBMzY1OFc0alhsYXdJWDFEcEpZNVBobkY1WkROWXkvTURqUEhj?=
 =?utf-8?B?cGk1QzgyT1NpL3hMVmQwcGYzZTF5UDhOcWsxQ0ZWZU5jTkU0ZmlVSzc5MEpZ?=
 =?utf-8?B?dXBtNWZ5Yk1OVmU0R1ZwQk40YWR6eWdNampjSEZORjY4Yk1HVTVoUjZuS2lE?=
 =?utf-8?B?MEdDTGcwWmpWT0xtbHZpaGdhZkc1Qy9VZlZOU2N3Nmk0dkR2bUU3OGdrT2Vj?=
 =?utf-8?B?dTZVdXVKNHBaanJkUGlWOFVVRUx5UldPVDZKZ0ZOSUJwekI5T0tJanRpU3Ew?=
 =?utf-8?B?Y0Q2bU9pdEJDOXJ6MjBiQ0pPMEtEVk9HQlJhNFdoNDRXNzlrVXNEQzN5ei9M?=
 =?utf-8?B?QVVITExjUXRWRWNJdXprRi9BWW1YZ25yM2xYRUdVYVgxbk14Wmg4WG9LNTU5?=
 =?utf-8?B?RTA2K1VoU29HVmJKM28zRlgrd3c0TGlOc0VuWU0xVFllbTV0dFV0eFI5RzlE?=
 =?utf-8?B?c1Fvd0x4TTczNmt6cHlzUXg3ZnRCZ1lCb2lXVkFJS3kzN1E5Vkt4bEEwM2Jk?=
 =?utf-8?B?eS81U29MdVhaZTAydEIyanIvTWx1QTVFcWsvNTEyb1QzelNRMTd0WnZHM2ZZ?=
 =?utf-8?B?YUtyanFZOCt3T0M4d1lVREkrT05FVDJQeVYxV2Fzd1V3anptY1h0eEUrZzY4?=
 =?utf-8?B?Slg2dmFhS3NrajZ3UW55V0doakJxbkNEd2tmeVZ6SnBOa2pFUmdUNFN6dGli?=
 =?utf-8?B?SGZULzl2ZGt0czJpNmVrZGFBaWtrZW51T2xGNkNPVjVHQUNYbXhqQWtoZkV3?=
 =?utf-8?B?cWxrOXVHWlBROU9GUkxwekJwVlRHSTZaOXNhVTdQNC9zM3RYV0M0SjVVUFNW?=
 =?utf-8?B?cklYN3NNMWFua2JGU3grbDBFMVNjbGhsRHY2aDhuZkFlTHM1c1I5R2J0bnNs?=
 =?utf-8?B?VkVIY2NaWk4zWVlraytvOGRWeFNmWjR1SkdiTWNJZ3NQdG5QdzUyN0pMMlI0?=
 =?utf-8?B?SWpvWWxWMHhScXRISzJrWXlZUE9PUU9rSWxacnU0UDVPUnNhSTBkT1QxdTB1?=
 =?utf-8?B?eGRFTXlaM3lickZjZThpRzZpR0ovY1NrNVA4c1BxQ3VHZ3IzYmF0YVhHbUd1?=
 =?utf-8?B?TDc2eVBmbStDTE5KTE80R3EreFdGczdVTTNoL1dNS1V1cUZhYzJXWDBLeGpm?=
 =?utf-8?B?UWlROHdaWndCMWdEODN5RXRyKzlOV1ZtdnExMXRhbEc2dWNLa1pZNUhncC9M?=
 =?utf-8?B?TVRQY3VpQzBsVnJ6UXMyM25YWUpFTEtOeG1FSTMzS1NIMFlUZFI1MzlUODJy?=
 =?utf-8?B?OThsZkEzZ2ZFd3ZhVDAzVHlmZnB3YWk1aCsraW5UVFNTVFVqWlNNY1g0ZVY4?=
 =?utf-8?Q?RR27FyV/83Hl1R4KOtIkQ3A=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943a6ccf-4bae-4a4a-cf4e-08db14db8e19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 13:49:01.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb3UR+sDpLgcu9YVjZSJqmKoBGi6hbeBMoCJr7M6wdaWAvunotNJbX3F8w/zys/aTpEf/kL2oRhv/il7z2leERR66DOJHGNJwh+I/i3ykEY88I3k+qO6v9r62iP2lJko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 13:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3712

Hi Michael,

On 2/21/23 19:41, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
>    variable index.
> - Clarify that these plugins are still open-source
> - Improve line width
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> ---
> 
> Changes in V2:
> - Style fixes
> - Highlight that the "bad" status is according to GStreamer contributors
> - Add a new "gstreamer-commercial-licenses" target so that we can refer
>    to the modified section without hardcoding the title and the manual
>    name in the reference. That's more resistant to changes.
> According to the review from Quentin Schulz (thanks!)
> ---
>   documentation/dev-manual/licenses.rst  | 32 +++++++++++++++-----------
>   documentation/ref-manual/variables.rst | 18 +++++++++++++++
>   2 files changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 65914e5efe..91a2ebce81 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -232,6 +232,8 @@ Here are some other scenarios:
>      in the :term:`LICENSE_FLAGS_ACCEPTED` list (e.g.
>      "commercial_foo_1.2") to specifically match a versioned recipe.
>   
> +.. _gstreamer-commercial-licenses:
> +

My bad, I thought there were more examples, unrelated to GStreamer, in 
the "Other Variables Related to Commercial Licenses" section. But here I 
don't think it makes much sense to add this target actually since we 
already have some automatically added by sphinx for sections/subsections.

Otherwise,
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

