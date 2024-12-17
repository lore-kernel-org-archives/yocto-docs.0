Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95B5E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 13:50:58 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.46])
 by mx.groups.io with SMTP id smtpd.web11.82058.1734443450247943250
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 05:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=SaVYSW9C;
 spf=pass (domain: cherry.de, ip: 40.107.103.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui1BpvkwFNHYe9P6WsKeYCfiUfDJXc5CJoGt1tm2p7cnsRGdOr4CQfhH3GhOL32nLagChuvC+M1eF+r/dFETBx3frj/FIuxcDQIzpT1FyzcVS5/l2SJgpiC+iNGbwqjHeciuXxnmGWYIKPpHoS/Khto7AxIb9Tdz2VqCpsTDggM7A8sK5tb2T5Q18ZffNsmiTDNE7jYxBj8gMx0SXjxafngU0KYOAQOXuPBAW6PiMTrontNm9OmspGIhK3p21gF2CLwrDuJDPmNL8Q6HrrUy6ZOG2y8UT1vHrYRIBOobhmcMuDMq2dT2BYOkMLru/o0ebk6wOvOUHjx7Txxecffq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SowpFW6CdSU4QAVWWnBE6cO/etCCeu3XwrFQfpHx+k=;
 b=tVQToTdCZwgrtnY8QXe//qZ5BguYcMS3h5tizQ09b4eVcqFxONpVwYR/eB5nUVpBbY2ObmqeW62PwX+EFpdNUNn+brxb24GlGgMXpr3H1V4AB6azcmUoU41b7lrfrN2N3WoImDfe3PdpylVotcpbli2m30pyLGl8+oUMxcVrhm0jeh8688vJwP4uleu0rsIN7p+h/TVNKzeHO0GUhn/3ICinLJQL1XOavJiZb7/aFhO6R5jxw3Lhoaofa/zTcsxdJJKbDZ9Ewv7CvdFkMnKMnhixZ8q5jyISgRK9P5eOkLjIC/pDqnX9qIOrhp7PJHozhbrrOir6Am9A39MECclHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SowpFW6CdSU4QAVWWnBE6cO/etCCeu3XwrFQfpHx+k=;
 b=SaVYSW9C8yVJIRWEmK6kTDHxERtXiqsxZj5exVncGKKelkQXkHeKuLDzWoHMqmMbfhNC6o/s29IsBy3yIUsK9r8jsa/ZcRiJWKgVNgayaICSIbmmUXBV37m+IDH5J3X1ZH0fwCbp14EvefgSdj45Y7X3Ejg1XTp0RGv4bWcnDhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8291.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 13:50:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 13:50:46 +0000
Message-ID: <edd1fc18-11c2-44fd-9d2a-ae21d22ff8a0@cherry.de>
Date: Tue, 17 Dec 2024 14:50:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 2/2] tools: add script for building
 documentation inside containers
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
 <20241210-instructions-shell-container-v1-2-6a7cdc404ff4@cherry.de>
 <D6DWNFLPU4PT.3BJVWQZNVWNHO@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6DWNFLPU4PT.3BJVWQZNVWNHO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c4b629-a9df-4ecb-d191-08dd1ea1cec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jnyAI2HO8aAhhB/VnD/VjgZNy5HOwk7omlnK6fVvxbV5kTPNe+0jiF1VwvD9?=
 =?us-ascii?Q?9Dt+9CWlqR7NQyj829d8rjwSusfcngHnxZMtoSSxzF0bZ2zwUtm6L8gUoTfV?=
 =?us-ascii?Q?W8PvF7n6rx384G5fYPvEbmvMduA7KUfJAqBqbeNYbaajpNRy4kRe5P8N74W6?=
 =?us-ascii?Q?KuhrITCkknf+ZuXKpWnCv5uLMmpvkt6wWm6KxWN1lXUVluyDm85jauSM6eIM?=
 =?us-ascii?Q?jFR9KKwMZ0mO1QpL3YvMaGVvlRXvLVO3IASaBFxUQAEzemBKxbMEii/bfcHN?=
 =?us-ascii?Q?/CE912Nw2vw67JS4lkhSjztMmdsUGoX3o5UH/V3UOaNo/t+LG9n5+Z8bNO1A?=
 =?us-ascii?Q?tkyaYyNRRu8JYLkxLSZnd397VPAaLwiKc6cDd9dRamehGKVfPwsclxsXba6k?=
 =?us-ascii?Q?EmwYw5CdJZAF8+tIZGop5Eg6vgkD9jXRXRCwgu2fMefNx0Eo+I0mdFNHcHBf?=
 =?us-ascii?Q?F10LcGq3wi4Blm6QK9ZhdcLcqALCB4WJTcqFKaKc/hyfdX6HFvqCnxdKMP70?=
 =?us-ascii?Q?5Ls5o40wkSF/fdK6oxSrEsqMQPy/EBjd1+mCuJM8ke0wkqg5RpJMuIjAns6R?=
 =?us-ascii?Q?ot0ppFoU5kzwLOjTBQsOI4skItoCA9YNi7P4KvagFk09q5A3ZMAD2jLS2mQ0?=
 =?us-ascii?Q?mRWnvUWXRDTc4aXXrLS2vIn3/SiZyOpEOmurOG1PLOnLinigowQpYYdjmRf5?=
 =?us-ascii?Q?M1Jv0wrmlcuCSuR27yRbOgSyTN808hs8j6r0/hMC68x/81Q3IeuzzoPAb6X5?=
 =?us-ascii?Q?oGvXwOZg+qzjAkiK1n7BY4NDM95ZPQa3YDj2wdshrKR6Y2/jTC8XeiPiDfqs?=
 =?us-ascii?Q?WcZrDBRhZjgOeQRWFBvR1tNI/qE0ClQqREgTFe1FO8/mO6zKhcZENMD9QH6H?=
 =?us-ascii?Q?XuR3rlubuqnCKL4kxieR9SLSBgFVFOs+RVWrtZMf+jwby4y7XSRKFja6oqTp?=
 =?us-ascii?Q?hoPGd9d0lXYwLWFVOjJ6ADSyQttAUs17U9CVxcMTig/67OwfjAX0jSohwl0u?=
 =?us-ascii?Q?m0ZiSztIXxUPXpyQFGYpBkbp7KIfKhQi+oh41K/6B9Yd9pqkJ0dL3JHuqaw1?=
 =?us-ascii?Q?EGjHEMPIu8D1IrZnOL8kcVJIvQl9RNkMnrw27xlkTCv6NrPK6XwwEmuO3iiO?=
 =?us-ascii?Q?7y7QNMT6VdtAS/QPWy6SULWPHapW6aO7TPbflAdhYSRNnIKiHMoyoUeFqumS?=
 =?us-ascii?Q?SoVmyNkI2VL3ffgwAY/C/q86RuS75nUlpdBaRl6668G2/LGuA2g+bTrLenVu?=
 =?us-ascii?Q?L1w9O0LIV2ypaKVTMq/3pLcVkqZJdQFYor66ApB9HhQCmwMsLw5+XueAidOV?=
 =?us-ascii?Q?LNPsxXghYhUSd6e210lRNlkvxrHH4mHzmotMheLHHvH7sMJeiNItB00ZFHBq?=
 =?us-ascii?Q?sa9mFDg6uaYtP7v7lLaNp3JnU2ns?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h0/6dw8X9KEKORUlMsl2FxDuUzPze5X4/j6Jw6PZQC/F4xMxdyU6WjuPhVFd?=
 =?us-ascii?Q?0eb1U2RlRQdBbZEExXpSaSyolwY7VKu05q0+OSDVZoB5KtegYgXcdQ4VnP6Z?=
 =?us-ascii?Q?VnRMrEMpsMNsi6Bghoq66Mrx7WBZ9q/EYW7vpuLoUztLP7/WBVTp1WB2AoCY?=
 =?us-ascii?Q?ns3IH24e20+S9nIsI524mRkxtvukoD3jdCMV3MI5KQQvhf73QSb7Ig7vCAsU?=
 =?us-ascii?Q?2Y+kR49DsWykHKVl1k6wxRqPXWVWK2HJbrm10VfIi1MDKtJagu696sPLag46?=
 =?us-ascii?Q?CJdwTcti3p4ShspvrUwGC76yZxA0H7y4Ix9S/CAWbfetP4UhTosCVj9wsjVm?=
 =?us-ascii?Q?334wgWS/T2z6YFoOZJZ/8pEPr4B4RL/rn16EJ2xHXBTZHkYn7osmtM2AOO49?=
 =?us-ascii?Q?l1G8mvlFNgORY4VHxfh4sZDhVgc15egwpLdZ9XfOOyMeK1c7mKq7mDN5dee5?=
 =?us-ascii?Q?Qc8TzxGJbPWXEgGCubrtYeds0Nd0WsHL97gRHZKWaH82qY9IQvYDHkLAzA8R?=
 =?us-ascii?Q?nRDXURdo7LrVAoBS1AqCZ30Y3yJfTQvMYk5uLWyIOkA6zxkMZkBm9zTmgCzG?=
 =?us-ascii?Q?97s5mLsHitRy2pSD+K1bp9jqd9PO+Drrvx+SfEUswydu4R/L0CR4oe4TyG/B?=
 =?us-ascii?Q?fQ9ZToUu+ZfwvaM0YTs3pY8siH8lPug4efbMZlA0XiWMo8yOxiAXXdZZpU/G?=
 =?us-ascii?Q?PIJv3A87YonkIlKSsH+RVAH3KZulTrwgOLXvrq1f5frKiADO2XKuydiEfwLK?=
 =?us-ascii?Q?0zFO4hfLpnXOXvRIu+P/YTZ6b7Q1JmJiWAPWwccp24KZwYCoDN/4Q3Av3Omh?=
 =?us-ascii?Q?tHrc3mUvOvRka0QaoR2GczLhtcbGf2U/BLkI1v3oKOSM1Zdb5xZ8EeFnaY9D?=
 =?us-ascii?Q?MCxebCAOF2MNZ2S0qjUmyPkn8WWy6lnJ5WFX21WBDCl1R7Fzu5Y2BNUxMuk4?=
 =?us-ascii?Q?Wmm/u/psb6WdYV/bDEZGptjUBJwqfxfFUNvhtBt+/sDhSOBQSjonouvY8H1N?=
 =?us-ascii?Q?fRX3VomV+JAJxPxTncxF4OBoXW3zypK+LzwaarTeOd/KL/xmXf0T/0qFC7ZO?=
 =?us-ascii?Q?1ftNhhhkguGoFB+cKPUu2LgHLbTvCYo6/o9rNW1Tf5AoSh3jUmV8QWU4QUOl?=
 =?us-ascii?Q?g5+GRP2pe3jSxzKT5wFQIW6t6fzaPoE6y3o3UgLeCEnMOgY/+LkjtvaEHEKI?=
 =?us-ascii?Q?kiu2VHaFA70Amj58yUy9ypbWMqO8aVF3+ALL/6GJnS+bybyOh0isLiS6ysP6?=
 =?us-ascii?Q?Jx+M2yXrst/ZjOJ+p75R0Tg0RcUgwz58ehDhIcesdG8zd551sbBpqOhRMZcN?=
 =?us-ascii?Q?B3YaLpCoOasFxUIZXjp2/JsLeldD1oiiUCnXk2JSJYGA6gw9r6QU89DokTKU?=
 =?us-ascii?Q?yoYNd3xL9ZcZ2W7ODbdJuQlIMxZYXlM4qTUcjONIC4K7uHyF9mKHN2YB2Uul?=
 =?us-ascii?Q?wycDs2yQJySORNSluHAHG2w2mJSZ+ADWAKklC9FSK3GgPDd3oYIpD6e3qGrT?=
 =?us-ascii?Q?+pweij9x0Vz7iiT2Lxnzru9G7lnOYFcSItJCyfYDJWJTTFeJJzEMPtB7Hu2s?=
 =?us-ascii?Q?LJrRRoEVmiQIaHJ0IydmkkB/yRWliphtoqKt4ujOaEPqJ8Fm6iecpz4QNsNP?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c4b629-a9df-4ecb-d191-08dd1ea1cec3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:50:46.5356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgrWdH6Tq1mRLBW0z09HWlmOuJmULJ6X6izjAMhq7cU3iO9LFCSTjlcg5swKXSdC3JmHYBWKOQWEWzv287evd+FxaYJ4C2rPUGTnoySrPFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8291
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 13:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5964

Hi Antonin,

On 12/17/24 11:31 AM, Antonin Godard wrote:
> Hi Quentin,
>=20
> On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This adds a script for building a container and building the
>> documentation within that new container image.
>>
>> The openSUSE instructions now require a --non-interactive flag otherwise
>> they fail to run. Sadly there doesn't seem to be a way to have this in
>> an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive.
>>
>> Note that the Ubuntu and openSUSE instructions currently do not work.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/tools/Containerfile.almalinux        |   1 +
>>   documentation/tools/Containerfile.apt              |  21 +++++
>>   documentation/tools/Containerfile.debian           |   1 +
>>   documentation/tools/Containerfile.dnf              |  19 ++++
>>   documentation/tools/Containerfile.fedora           |   1 +
>>   documentation/tools/Containerfile.ubuntu           |   1 +
>>   documentation/tools/Containerfile.zypper           |  18 ++++
>>   documentation/tools/build-docs-container           | 101 +++++++++++++=
++++++++
>>   documentation/tools/opensuse_host_packages_docs.sh |   2 +-
>>   .../tools/opensuse_host_packages_essential.sh      |   2 +-
>>   10 files changed, 165 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/tools/Containerfile.almalinux b/documentation=
/tools/Containerfile.almalinux
>> new file mode 120000
>> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b1=
1fa6cefe9daaec74
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.almalinux
>> @@ -0,0 +1 @@
>> +Containerfile.dnf
>> \ No newline at end of file
>> diff --git a/documentation/tools/Containerfile.apt b/documentation/tools=
/Containerfile.apt
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a601699ce4005b3bc5288990=
dbf2e7fa235ea431
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.apt
>> @@ -0,0 +1,21 @@
>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>> +FROM $ARG_FROM
>> +
>> +ARG HOST_DOCS_PACKAGES=3Dubuntu_host_packages_docs.sh
>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +
>> +# relative to the location of the dockerfile
>> +COPY --chmod=3D777 ${HOST_DOCS_PACKAGES} /temp/host_packages_docs.sh
>> +
>> +RUN apt-get update \
>> + && apt-get install -y sudo \
>> + && yes | /temp/host_packages_docs.sh \
>> + && apt-get --yes autoremove \
>> + && apt-get clean \
>> + && rm -rf /temp
>> +
>> +RUN git config --global --add safe.directory /docs
>> +
>> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
>> +CMD ["publish"]
>=20
> Are we able to override this from the command-line, with the
> build-docs-container script? I assume everything passed in "$*" below rep=
laces
> CMD?
>=20

Yes, I'm currently calling the script like that:

./tools/build-docs-container fedora:40 html
./tools/build-docs-container fedora:40 latexpdf

or ./tools/build-docs-container fedora:40 latexpdf html (in v2, broken=20
in v1).

If you omit it, it'll call "publish", which is what you decided would be=20
the default in **your** v1. We can have nothing instead which would call=20
"all" I guess instead? Up to you.

Cheers,
Quentin

