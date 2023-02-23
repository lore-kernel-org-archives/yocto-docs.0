Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04D4C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 10:27:58 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.64])
 by mx.groups.io with SMTP id smtpd.web10.7461.1677148072693915561
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 02:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=cadcJJ8p;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.241.64, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTBlHXTtPxarY4Gr4O+Hk7i4KvaZgfyZqFvguLcXSNR+g9oQ6s9YGXUauiLbDIMINfscd/+j3bl5L+oZepoB8ZbG9kwI3cZLW55inaHOuSumL1z+KtPoL69nFzqUxH2zFvvL13MmAgRHBR/Wsvl3meaK0vO4SR7LMsK8dmGlyW5NmU1+MDF3/Fsx95PUqK2nQ8ledZbdegCyoXSqpvt11jCCt2cINYEomMLJGGlYvVVk14hjVsF+i//Hx+fd71RUA1ompGKBobZvRaogO7QPAwL6HaBo1i/SdWOhzBrdIcfPGi3+coavJ6GnYsnQ7dOLQ7jkdKSO0K+V9TrC7j4HSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mmz5mv9S4dRBW3h2KJoO+E6P2H4LU51Ewc+cptN+H4=;
 b=GZ2akqTbJgvVr+OIjZFmJwTOpOF8H7D9oH5cvUScpXiYc8ocitql1KvNPx13B9gtoPGIkn+DlV91UY/8kK/LnrIPt88p8b6Sf+EUMiNyUtRfikldVkfnEBmNYAJkQ2z5AnsjTpCeBS6AFuU8fqpSXwrEOBHVMdJTngkfHNN6nDC18qW09tJ11M7lyX/GOMunwQEuGitjNQrVCCy0lKXYo9BFYuNKecfTt2bJ0lnRg1sxD/SHBbH3doZBU/+TRvgW1L3IQRrqKnv1bm1E7GWP7DYFrGZg0NfBmXFzX/WUusGmDlK+7HfuaI+teGLlkWowfH5hzET4EfM1C5vAs50q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mmz5mv9S4dRBW3h2KJoO+E6P2H4LU51Ewc+cptN+H4=;
 b=cadcJJ8pN+hcDc2FtsPYEeRDItCZW8GoQuGj+H3L12t7uaguTbVpx+njiWuhCjoXlijK7PemZjV12NjuqYk4HBo2FGpwByTgwMqPUoql43Oy7EwvTTUKKlpOe2Num1iP7lL3ZL7tqicfNOtppZtAR6Eep8AUH0fRp9xo+kw1LHKUh7CxlJ3MpsI6ko29rJM1sblkiJoeHthoTqEKuNQJulbrNPtCWS3AbW83HwD6oy4AkJJQWwF0ffNYpx7DzskaKkol3zaHqriSr2l52Y3PZN9Ihrds3wLRGMdTGD1PLPHGdrnphVEpYlB/igF7PrbQg12naMpQ7a1yfhgqpzuxyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 10:27:48 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 10:27:48 +0000
Message-ID: <e252edd0-7c9c-0072-5af6-d36c4fb55400@theobroma-systems.com>
Date: Thu, 23 Feb 2023 11:27:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH v2] manuals: document
 COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
 <20230221184156.65816-1-michael.opdenacker@bootlin.com>
 <9a2b7892-fdd6-362b-3950-5c216dd3ed66@theobroma-systems.com>
 <54b9159e-3549-8593-9bc7-11f327baf09b@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <54b9159e-3549-8593-9bc7-11f327baf09b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6979ca71-fe13-4a8c-54d2-08db15889c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/d/xQ9Jt91KTJDqRrBuwJI/Id7/mTP5GmUvh51yBDTSUd2u0M8rwSs4pCwwsQo4NRiHbNkbJzIRy5jXl9wYumDm8c+he1n1R62s0n9vFLbxU7c+I38460CzpjjO9MTiP+UdbZg9ioGgycivWQjcwaIaV5/Jsru3EmIy1iPd/gevCzvUTqrGK0U5YTJ8CRK/3cILaCwyrecR3MPLDn9SbUyz61UkfHdoSTTuqAS3q2QBE5WhPQXzaxkzBDgMtPv71Na7CAvrsxNreNhxqThfaS16PHR2wSHk+zIgVN8F1XXW7LRha9GtBdyqz+VIldjFeLytazvcMgmkdZv/AvG1Jr/mTgDV8by6V7jXEqGUimtqFdn8C+Ngh13iwQnOqAZCo9ao4JMRPmiMrnyR/ZZk13qSLmrTKbx7cyzPj9rBF44QP+WWRiilprtcPJ91bs5TaBXKo3szwA5vdIpdaZVUTe71YRBU/uKP/8u1n7sWWjN4n8RSflRsPZNBcKUSbNSCzUWONK2UtNxuRggkpIDAhVZUvvuWOA3HyRGuIiYWZ7F48gOyLi8cl47oQfOGvU6O3SlHrhAuoRsXM+rLD08lKuWHO+mPyc/TN8mWUbAO8az9umSzG4ewgg0pMfgpto6hx7/TQD3foqPCrYSvtJAqPMBX7oQtVcw2QZpb3ASixXgbhZym4zvXluMcS9od8c9f/+C9aU6zAJRXndolQTMgIwNL/hsQVbGKTom2WPbg6JJA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(86362001)(31696002)(966005)(2616005)(31686004)(316002)(6486002)(2906002)(66556008)(66946007)(44832011)(4326008)(5660300002)(8676002)(66476007)(6916009)(41300700001)(6512007)(6506007)(53546011)(478600001)(186003)(26005)(36756003)(38100700002)(8936002)(83380400001)(83133001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4JEisAYjSA+oefG9X13s2W6iPbP+eqa6jacTIYN2VnPD/ll2PiwXGy0C9cIV?=
 =?us-ascii?Q?yZ4nxXxqcS/c6xyTPAzUxSeFHSKzIpSXUq5+QKZCLONRmDK9qwx4fh8serJE?=
 =?us-ascii?Q?0S+6JngDE+SAt6SVhtXMxlaWwHF7hbpyyaDf/31hDolgsCtMFHU1aBpTM5tw?=
 =?us-ascii?Q?VOKd+icmIkyLZwHdj2cVPRAC/Y13tJHlpyEqGJsHS+5xamkshehEZZ37e95V?=
 =?us-ascii?Q?rMApKxyfIcdX+k3zCaJAVe0M7MXR7QhZcx/JOkxCDY5c+vUU3joIEsOFQl4U?=
 =?us-ascii?Q?WguaDzi9ng+typaTjp9RutLJHwO8yUkvecL32Wm0JzopG2Bw4AgQ1JPjtB8q?=
 =?us-ascii?Q?jnAdCy4BbXXb0vqt3sAs1Mbnr1OCwtbq8KEvOgIQkkBylXZjqif9mftNDzxP?=
 =?us-ascii?Q?gLJgKHIDFa4dSRTjLuPtJaDHQQclgnwd/Qrb2gwCoV/HTLQFQrMtXeJHTrCP?=
 =?us-ascii?Q?dIxPXGE9nMYYUVW8krxoJCvxGPMG+JJoUmraS5s11kOvRmXbHacxkIC8NDLP?=
 =?us-ascii?Q?KGlH5uVQiaL8Bz82fz5qUiD+mUGcflz4HTmXxsblTTfowcrKua0JuAr3P/md?=
 =?us-ascii?Q?yRGQBOPUl2DAJnIca5VDWdSP8jm4cEMeYmDFapKyWmr1QtAMQdaMrqdXgyZ3?=
 =?us-ascii?Q?7QDCgVTliJhUtv8KFgVtFSaDUd2JT/XD8yLxHJRo1nUUdXftYyk47+75CIjx?=
 =?us-ascii?Q?kEuUD2/4tOo38ni4VLQoqY5sf7qgTwEJcWSqwPe4eM6+/a4N/o8b6+c60opL?=
 =?us-ascii?Q?107G+MhSxgWa5Ich7myc6669ruxJPZTAw1/UaMvLLYHu21VVnF24X/Qu6byC?=
 =?us-ascii?Q?O5O52yndjrTXZJjer8Ir4J0eAx7M1kdAPX7HQR89u3M3UlseITxVrHLmaEpf?=
 =?us-ascii?Q?YLnD9+tTyDelF3x0G+FcUboFHiwqpHfUNyxEGDmgFps25dyAzXTGzmSrzKV7?=
 =?us-ascii?Q?+uuwvuydjGRbA65sgkovR3rNGY+1oAuwbq0I7aRNwDbnU98u1oXaDQUh02KA?=
 =?us-ascii?Q?yYaFvM/xym1RDntHNLm9XeXNfNJnKgG2qGCsnz9J0dbt3mBFhcEx0G0zHJ7Y?=
 =?us-ascii?Q?pazedEsSpOXG5oJI6/6LL1icdUmIRUK/OwajF5VMs1mU7FYQFZW4W+k7Pg9J?=
 =?us-ascii?Q?Rj+XiBIH/rmzrg8HSBD22DZLeUWBKJ96+6TjTPFucVD2yxGjo+KbnVbxHJEk?=
 =?us-ascii?Q?ILa0n49tyT1I/P1Xmui6xRJ+CH2aopkKUvtNoCQxsFbkyV/o4VUH1RwWvdJS?=
 =?us-ascii?Q?bNQlV93hA41k7llQP67F+FiQL59gtN5pwI/Op0wonw6KozTndYCb8jHAH/xQ?=
 =?us-ascii?Q?JOq5vQF6B/CxU/sBNTcRJgr3vKOQ9mFm3APZV/e9dNZhf5XZn/UP+jkf+kq6?=
 =?us-ascii?Q?0VqtqBu87d70Gh0z974EdZu1TWaS1r6MR+NCz3Dm+1yEBK3dg47Jz5J+63iN?=
 =?us-ascii?Q?JtxgREZG17ogztipEppgYUdZBKBqjB3hawty3qe1Bx7ARLJjHafjLtJZ/GDp?=
 =?us-ascii?Q?61kWThNVDtlioNhFY9HfyRtoMJDFt3zItHWyghsgH44piQ0kOGiDRM9+WBr/?=
 =?us-ascii?Q?k7HEBejCzabnyuCVp9DoEi6AHFGiMlvL8eHy07Q+f/IFph/58/m6qqIQDPEC?=
 =?us-ascii?Q?b0vZIbc0DSDsS3YqRp/dams=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6979ca71-fe13-4a8c-54d2-08db15889c06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:27:48.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbBX8Tl49DNumCVJZEMefmCR/S0fKa23NQfPrneqNLDq5qLhVWKY+uNfgnSbMmNbg/N/MYWCqWwqh8WuCEv+bLdfmNiY8Xs01LR6BRqq48qG/TNdQ+EEsqxkYpO6XTX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 10:27:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3723

Hi Michael,

On 2/23/23 10:57, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> On 22.02.23 at 14:49, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Michael,
>>
>> On 2/21/23 19:41, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> - Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
>>> =C2=A0=C2=A0 variable index.
>>> - Clarify that these plugins are still open-source
>>> - Improve line width
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> ---
>>>
>>> Changes in V2:
>>> - Style fixes
>>> - Highlight that the "bad" status is according to GStreamer contributor=
s
>>> - Add a new "gstreamer-commercial-licenses" target so that we can refer
>>> =C2=A0=C2=A0 to the modified section without hardcoding the title and t=
he manual
>>> =C2=A0=C2=A0 name in the reference. That's more resistant to changes.
>>> According to the review from Quentin Schulz (thanks!)
>>> ---
>>> =C2=A0 documentation/dev-manual/licenses.rst=C2=A0 | 32 +++++++++++++++=
-----------
>>> =C2=A0 documentation/ref-manual/variables.rst | 18 +++++++++++++++
>>> =C2=A0 2 files changed, 37 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/licenses.rst=20
>>> b/documentation/dev-manual/licenses.rst
>>> index 65914e5efe..91a2ebce81 100644
>>> --- a/documentation/dev-manual/licenses.rst
>>> +++ b/documentation/dev-manual/licenses.rst
>>> @@ -232,6 +232,8 @@ Here are some other scenarios:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 in the :term:`LICENSE_FLAGS_ACCEPTED` list (e.=
g.
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "commercial_foo_1.2") to specifically match a =
versioned recipe.
>>> =C2=A0 +.. _gstreamer-commercial-licenses:
>>> +
>>
>> My bad, I thought there were more examples, unrelated to GStreamer, in=20
>> the "Other Variables Related to Commercial Licenses" section. But here=20
>> I don't think it makes much sense to add this target actually since we=20
>> already have some automatically added by sphinx for sections/subsections=
.
>>
>> Otherwise,
>> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
>=20
>=20
> I'm not sure I understand, because the idea to use references to targets=
=20
> without referring to the document name made sense to me.
>=20

What would be the use for the autogeneration of sphinx targets from=20
sphinx sections if we have some sections with additional manual targets?

What I wanted to use manual targets for is for pointing at content=20
**within** a Sphinx section. e.g.=20
https://docs.yoctoproject.org/3.1.23/ref-manual/faq.html. We could have=20
had a target for each Q: line for example instead of migrating to=20
sections and subsections like we did recently (c.f. what's in langdale).

Hope I explained myself a bit better this time :)

Cheers,
Quentin

